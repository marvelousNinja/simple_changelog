module SimpleChangelog
  class Repository
  	def initialize(path = Rails.root)
  		@repo = Grit::Repo.new path
  		@tags = @repo.tags
 			@commits = @repo.commits
  	end

  	def load_history
  		history = {}
  		if @tags.any? || @commits.any?
	  		middle_tags = convert_tags(@tags).sort_by { |t| t.name }
	  		tags = [head_tag] + middle_tags + [tail_tag]
			
				tags.each_cons(2) do |prev, succ|
			    history[prev] = commits_between(succ, prev)
				end
			end

  		history
  	end

  	def current_version_tag
  		if @tags.empty?  			
  			@commits.empty? ? '' : 'HEAD'
  		else
  			@tags.first.name
  		end
  	end

  	private

  	def head_tag
  		commit = @repo.commits('master', 1).first
  		Tag.new('HEAD', 'none', commit.date, commit.id)
  	end

  	def tail_tag
  		commit = @repo.commits('master', 1, @repo.commit_count - 1).first
  		Tag.new('TAIL', 'none', commit.date, commit.id)
  	end

  	def commits_between(from, to)
  		commits = @repo.commits_between(from.commit_id, to.commit_id)
  		convert_commits(commits)
  	end

  	def convert_commits(commits)
  		commits.map do |c| 
  			Commit.new(c.message,
  								 c.author,
  								 c.date,
  								 c.id)
  		end
  	end

  	def convert_tags(tags)
  		tags.map do |t| 
  			Tag.new(t.name,
  							t.author,
  							t.date,
  							t.id)
  		end
  	end
  end
end