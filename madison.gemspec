lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'madison/version'

Gem::Specification.new do |s|
  s.name = "madison"
  s.version = Madison::VERSION
  s.authors = ["Mike Ball"]
  s.description = "Get a U.S. state name from its abbreviation or get a U.S. state abbreviation from its name."
  s.summary = "A simple Ruby gem for working with U.S. state names and abbreviations."
  s.email = "mikedball@gmail.com"
  s.homepage = "http://github.com/mdb/madison.rb"
  s.licenses = ["MIT"]
  s.files = `git ls-files`.split($/)
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "json"

  s.add_development_dependency "bundler"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
end
