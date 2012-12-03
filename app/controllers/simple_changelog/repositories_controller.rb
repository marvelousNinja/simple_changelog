require_dependency "simple_changelog/application_controller"

module SimpleChangelog
  class RepositoriesController < ApplicationController
    def show
    	@repo = Repository.new
      @changelog = @repo.load_history
    end
  end
end
