[![Build Status](https://secure.travis-ci.org/mdb/ruby-madison.png)](http://travis-ci.org/mdb/ruby-madison)

# madison

A dirt simple Ruby gem for working with US state names and abbreviations.

This is the Ruby version of Node.js [madison](http://github.com/mdb/madison) and was built as an example gem for other developers.

Note that it's currently unpublished.

## Installation

    git clone https://github.com/mdb/ruby-madison
    cd ruby-madison 
    bundle install
    rake install

## Run Rspec tests

    rake

## View code coverage after running Rspec tests

    open coverage/index.html

## Usage 

Require madison:
  
    require 'madison'

Initialize madison:

    m = Madison.new

Get a state's abbreviation:

    m.get_abbrev 'virginia' // 'VA'

Get a state's name asynchronously:

    m.get_name 'va' // 'Virginia'

Get a Ruby hash of US states, each containing 'name' and 'abbr' properties:

    m.states
