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

Madison can be mixed into a class, or its singleton methods
can be called directly on the `Madison` module.

Require madison:

```ruby
require 'madison'
```

### Include it as a mixin

```ruby
class MyClass
  include Madison
end

my_class = MyClass.new
```

Get a state's abbreviation:

```ruby
my_class.state_abbrev 'virginia'
# => VA
```

Get a state's name:

```ruby
my_class.state_name 'va'
# => Virginia
```

Get an array of US state names/abbreviations:

```ruby
my_class.states
# => [
#  {
#    name: 'Virginia',
#    abbr: 'VA'
#  },
#  ...
#]
```

Get the Madison::Map class used

```ruby
my_class.madison_map
# => <Madison::Map:0x007f8dbc80e7f0>
```

### Use its singleton methods on the Madison module

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
#  {
#    name: 'Virginia',
#    abbr: 'VA'
#  },
#  ...
#]
```
