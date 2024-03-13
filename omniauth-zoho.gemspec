# -*- encoding: utf-8 -*-
# stub: omniauth-zoho 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-zoho".freeze
  s.version = "0.4.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mike Machado".freeze]
  s.date = "2023-12-27"
  s.email = ["mike@leaddyno.com".freeze]
  s.files = [".gitignore".freeze, ".travis.yml".freeze, "Gemfile".freeze, "README.md".freeze, "Rakefile".freeze, "lib/omniauth-zoho.rb".freeze, "lib/omniauth/strategies/zoho.rb".freeze, "lib/omniauth/zoho.rb".freeze, "lib/omniauth/zoho/version.rb".freeze, "omniauth-zoho.gemspec".freeze]
  s.homepage = "https://github.com/LeadDyno/omniauth-zoho".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.3".freeze
  s.summary = "Zoho strategy for OmniAuth.".freeze

  s.installed_by_version = "3.5.3".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<omniauth-oauth2>.freeze, [">= 1.2.0".freeze, "< 2.0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.11".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10.0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0".freeze])
end
