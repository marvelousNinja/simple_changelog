module SimpleChangelog
  module RepositoriesHelper
    def long_date_format(datetime)
      datetime.to_date.to_formatted_s :long
    end

    def highlight_commit_tags(commit_message)  
      highlighted_message = commit_message.gsub(/\[[^\[\]]+\]/) do |tag|
        tag_class = tag.gsub(/[^A-Za-z]/, '').downcase
        content_tag(:span, class:tag_class) { tag }
      end
      
       highlighted_message.html_safe
    end

    def current_version_tag
      Repository.new.current_version_tag
    end
  end
end
