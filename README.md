[![Build Status](https://travis-ci.org/mdb/madison.rb.svg?branch=master)](https://travis-ci.org/mdb/madison.rb)

# madison

A dirt simple Ruby gem for working with US state names and abbreviations.

This is the Ruby version of the Node.js [madison](http://github.com/mdb/madison) and was built as an example gem for other developers.

## Installation

The released gem (recommended):

```
$ gem install madison
```

## Usage

Require madison:

```ruby
require 'madison'
```

Get a state's abbreviation:

```ruby
Madison.get_abbrev 'virginia'
# => VA
```

Get a state's name:

```ruby
Madison.get_name 'va'
# => Virginia
```

Get an array of US state names/abbreviations:

```ruby
Madison.states
# => [
  {
    name: 'Virginia',
    abbr: 'VA'
  },
  ...
]
```
