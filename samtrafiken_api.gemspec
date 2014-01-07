# -*- encoding: utf-8 -*-
require File.expand_path("../lib/samtrafiken_api/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'samtrafiken_api'
  s.version     = SamtrafikenAPI::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Samtrafiken web APIs"
  s.description = "A ruby implementation of the Samtrafiken web APIs."
  s.authors     = ["Hannes Lilljequist"]
  s.email       = 'hannes@sthlmconnection.se'
  s.homepage    = 'http://rubygems.org/gems/samtrafiken_api'
  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rake", "~> 10.1"
  s.add_development_dependency "rspec", "~> 2.6"
  s.add_development_dependency "rubysl", "~> 2.0" if RUBY_ENGINE = "rbx"

  s.add_runtime_dependency 'httparty', '~> 0.11'

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'
end
