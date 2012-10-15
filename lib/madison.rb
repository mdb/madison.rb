require 'json'

class Madison
  attr_accessor :states

  def states 
    @states ||= JSON.parse( File.open(File.join("lib", "states.json")).read )
  end

  def get_abbrev(name)
    raise ArgumentError("Argument must be a string") unless name.is_a? String
    state_abbrevs[name.downcase]
  end

  def get_name(abbrev)
    raise ArgumentError("Argument must be a string") unless abbrev.is_a? String
    state_names[abbrev.downcase]
  end

  private
  def state_names
    @state_names ||= build_map('abbr', 'name')
  end

  def state_abbrevs
    @state_abbrevs ||= build_map('name', 'abbr')
  end

  def build_map(in_key, out_key)
    states.inject({}) do |map, state|
      map[state[in_key].downcase] = state[out_key]
      map 
    end
  end
end
