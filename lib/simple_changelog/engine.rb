require 'grit'

module SimpleChangelog
  class Engine < ::Rails::Engine
    isolate_namespace SimpleChangelog

    config.generators do |g|
			g.test_framework :rspec, :view_specs => false
		end

		initializer 'simple_changelog.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper RepositoriesHelper
      end
    end
  end
end
