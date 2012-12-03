module SimpleChangelog
  class Repository
  	def initialize(path = Rails.root)
  		@repo = Grit::Repo.new path
  	end

  	def load_history
  		{}
  	end

  	def current_version_tag
    	''
  	end
  end
end