module SimpleChangelog
  class Tag
  	def initialize(tag)
  		@tag = tag
  	end

  	def name
  		@tag.name
  	end

  	def author
  		@tag.author
  	end

  	def date
  		@tag.tag_date
  	end

  	def commit_key
  		@tag.commit.id
  	end
  end
end
