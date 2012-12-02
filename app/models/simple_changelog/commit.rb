module SimpleChangelog
  class Commit

  	attr_reader :message, :author, :date, :id
  	
  	def initialize(commit)
  		@message = commit.short_message
  		@author = commit.author
  		@date = commit.date
  		@id = commit.id
  	end
  end
end
