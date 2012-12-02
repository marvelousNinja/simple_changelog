module SimpleChangelog
  class Repository
  	def initialize(path = Rails.root)
  		@repo = Grit::Repo.new path
  	end
  end
end