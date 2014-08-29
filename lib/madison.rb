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
end
