require 'grit'

module SimpleChangelog
  class Engine < ::Rails::Engine
    isolate_namespace SimpleChangelog

    config.generators do |g|
			g.test_framework :rspec, :view_specs => false
		end
  end
end
