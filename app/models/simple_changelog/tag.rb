module SimpleChangelog
  class Tag

  	attr_reader :name, :author, :date, :commit_id

  	def initialize(tag)
  		@name = tag.name
  		@author = tag.author
  		@date = tag.tag_date
  		@commit_id = tag.commit.id  		
  	end
  end
end
