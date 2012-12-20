$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_changelog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_changelog"
  s.version     = SimpleChangelog::VERSION
  s.authors     = ["Alex Sologub"]
  s.email       = ["alexsologoub@gmail.com"]
  s.homepage    = "https://github.com/marvelousNinja/simple_changelog.git"
  s.summary     = "Simple gem for rails applications and their git repositories. Mounts page with history of commits."
  s.description = "Simple gem for rails applications and their git repositories. Mounts page with history of commits."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "grit", "2.5.0"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
end
