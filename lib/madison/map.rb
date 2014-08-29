require 'json'

module Madison
  class Map
    attr_accessor :states

    def states
      lib_dir = File.expand_path(File.dirname(File.dirname(__FILE__)))

      @states ||= JSON.parse( File.open(File.join(lib_dir, "madison", "states.json")).read)
    end

    def get_abbrev(name)
      validate_arg(name)
      state_abbrevs[name.downcase]
    end

    def get_name(abbrev)
      validate_arg(abbrev)
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

    def validate_arg(arg)
      raise ArgumentError, "Argument '#{arg}' must be a string" unless arg.is_a? String
    end
  end
end
