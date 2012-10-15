Gem::Specification.new do |s|
  s.name        = 'madison'
  s.version     = '0.0.0.0'
  s.date        = '2012-10-14'
  s.summary     = "A simple Ruby gem for working with U.S. state names and abbreviations."
  s.description = "Get a U.S. state name from its abbreviation or get a U.S. state abbreviation from its name."
  s.authors     = ["Mike Ball"]
  s.files       = ["lib/madison.rb"]
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n") 
  s.homepage    = 'http://github.com/mdb/ruby-madison'
  s.require_paths = ["lib"]
  s.add_dependency 'json'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
end
