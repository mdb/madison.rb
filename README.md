[![Build Status](https://secure.travis-ci.org/mdb/ruby-madison.png)](http://travis-ci.org/mdb/ruby-madison)

# madison

A dirt simple Ruby gem for working with US state names and abbreviations.

This is the Ruby version of the Node.js [madison](http://github.com/mdb/madison) and was built as an example gem for other developers.

## Installation

The released gem (recommended):

    gem install madison

Alternatively, from source code:

    git clone https://github.com/mdb/madison.rb
    cd madison.rb
    bundle install
    rake install

## Run Rspec tests

(Assuming you've installed from source code)

    rake

## View code coverage after running Rspec tests

(Again, assuming you've installed from source code)

    open coverage/index.html

## Usage 

Require madison:
  
    require 'madison'

Get a state's abbreviation:

    Madison.get_abbrev 'virginia' // 'VA'

Get a state's name asynchronously:

    Madison.get_name 'va' // 'Virginia'

Get a Ruby hash of US states, each containing 'name' and 'abbr' properties:

    Madison.states
