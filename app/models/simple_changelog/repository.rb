module SimpleChangelog
  class Repository

    NEW_LINE_SPLITTER = /\r?\n/

    def initialize(path = Rails.root)
      @repo = MiniGit.new path

      create_tags
    end

    def load_history
      history = {}

      if @tags.any?
        @tags.each_cons(2) do |prev, succ|
          history[prev] = commits_between(succ, prev)
        end
      end

      history
    end

    private

    def create_tags
      tags_string = @repo.capturing.log tags: true, 'simplify-by-decoration' => true, pretty: 'format:%d|q%ai'

      @tags = []

      tags_string.split(NEW_LINE_SPLITTER).each do |tag_info|
        match = /\A\((.+)\)\|(.+)\z/.match(tag_info.strip)
        if match
          names = match[1]
          datetime = DateTime.parse(match[2])

          names.split(',').each do |name|
            @tags << SimpleChangelog::Tag.new(name.strip, datetime)
          end
        end
      end

      @tags.sort! { |a, b| -(a.datetime <=> b.datetime) }
    end

    def commits_between(prev, succ)
      commits = []
      commits_string = @repo.capturing.log "#{prev.name}..#{succ.name}", pretty: 'format:%an|%s'

      commits_string.split(NEW_LINE_SPLITTER).each do |commmit_info|
        match = /\A(.+?)\|(\[(.+)\])(.+)\z/.match(commmit_info.strip)

        if match
          names = match[3].split('][')
          type = names.pop if names.count > 1

          commits << SimpleChangelog::Commit.new(names.join(', '), type, (match[4].strip if match[4]), match[1])
        end
      end

      commits
    end
  end
end