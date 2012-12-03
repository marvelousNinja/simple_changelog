module SimpleChangelog
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Mounts simple_changelog to your application."

      def mount_engine
        route 'mount SimpleChangelog::Engine => "/simple_changelog", as: "simple_changelog" '
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end