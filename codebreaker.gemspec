# stub: codebreaker 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "codebreaker".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  if s.respond_to? :metadata=
    s.metadata = { "homepage_uri" => "https://github.com/etherell/codebreaker",
                   "source_code_uri" => "https://github.com/etherell/codebreaker" }
  end
  s.require_paths = ["lib".freeze]
  s.authors = ["etherell".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-01-30"
  s.description = "Second rubygarage task".freeze
  s.email = ["kostyaetherell@gmail.com".freeze]
  s.files = [".circleci/config.yml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rubocop.yml".freeze,
             "CHANGELOG.md".freeze, "Gemfile".freeze, "Gemfile.lock".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "bin/console".freeze, "bin/setup".freeze, "codebreaker.gemspec".freeze, "lib/codebreaker.rb".freeze, "lib/codebreaker/game.rb".freeze, "lib/codebreaker/player.rb".freeze, "lib/codebreaker/validations.rb".freeze, "lib/codebreaker/version.rb".freeze]
  s.homepage = "https://github.com/etherell/codebreaker".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.2".freeze)
  s.rubygems_version = "3.2.3".freeze
  s.summary = "Codebreaker game".freeze

  s.installed_by_version = "3.2.3" if s.respond_to? :installed_by_version

  s.specification_version = 4 if s.respond_to? :specification_version

  if s.respond_to? :add_runtime_dependency
    s.add_runtime_dependency("rake".freeze, [">= 0"])
    s.add_development_dependency("rspec".freeze, [">= 0"])
    s.add_development_dependency("fasterer".freeze, [">= 0"])
    s.add_development_dependency("pry-byebug".freeze, [">= 0"])
    s.add_development_dependency("rubocop".freeze, [">= 0"])
    s.add_development_dependency("rubocop-rspec".freeze, [">= 0"])
    s.add_development_dependency("rubycritic".freeze, [">= 0"])
    s.add_development_dependency("faker".freeze, [">= 0"])
  else
    s.add_dependency("rake".freeze, [">= 0"])
    s.add_dependency("rspec".freeze, [">= 0"])
    s.add_dependency("fasterer".freeze, [">= 0"])
    s.add_dependency("pry-byebug".freeze, [">= 0"])
    s.add_dependency("rubocop".freeze, [">= 0"])
    s.add_dependency("rubocop-rspec".freeze, [">= 0"])
    s.add_dependency("rubycritic".freeze, [">= 0"])
    s.add_dependency("faker".freeze, [">= 0"])
  end
end
