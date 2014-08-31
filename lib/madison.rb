require 'madison/version'
require 'madison/map'

module Madison
  @map = Madison::Map.new

  def self.states
    @map.states
  end

  def self.get_abbrev(name)
    @map.get_abbrev(name)
  end

  def self.get_name(abbrev)
    @map.get_name(abbrev)
  end

  # mixin methods

  def states
    madison_map.states
  end

  def state_name(abbrev)
    madison_map.get_name(abbrev)
  end

  def state_abbrev(name)
    madison_map.get_abbrev(name)
  end

  def madison_map
    @madison_map ||= Madison::Map.new
  end
end
