require 'spec_helper'

describe Madison::Map do
  let (:map) { Madison::Map.new }

  it "exists as a class within the Madison module" do
    expect(Madison::Map.class).to eq Class
  end

  describe "#states" do
    it "returns a an array of state names and abbreviations" do
      expect(map.states.length).to eq 51
    end

    context "an item within the #states array" do
      it "contains a 'name' key the value of which is the state name" do
        expect(map.states[0]['name']).to eq "Alabama"
      end

      it "contains an 'abbr' key, the value of which is the state abbreviation" do
        expect(map.states[50]['abbr']).to eq "WY"
      end
    end
  end

  describe "#get_abbrev" do
    it "returns a state's abbreviation when it's passed a state's name" do
      expect(map.get_abbrev("virginia")).to eq "VA"
      expect(map.get_abbrev("west virginia")).to eq "WV"
    end

    it "returns a state's abbreviation when it's passed a state's name, indpendent of the argument's case" do
      expect(map.get_abbrev("virginiA")).to eq "VA"
      expect(map.get_abbrev("AlaBama")).to eq "AL"
    end

    it "returns nil in the event that is not passed a valid state name" do
      expect(map.get_abbrev("Fake State")).to be_nil
    end

    context "when it is not passed a string" do
      it "raises an ArgumentError if it is passed an integer" do
        expect { map.get_abbrev(3) }.to raise_error
      end

      it "raises an ArgumentError if it is passed a nil" do
        expect { map.get_abbrev(nil) }.to raise_error
      end

      it "raises an ArgumentError if it is passed a hash" do
        expect { map.get_abbrev({}) }.to raise_error
      end
    end
  end

  describe "#get_name" do
    it "returns a state's abbreviation when it's passed a state's name" do
      expect(map.get_name("va")).to eq "Virginia"
      expect(map.get_name("WV")).to eq "West Virginia"
    end

    it "returns a state's abbreviation when it's passed a state's name, indpendent of the argument's case" do
      expect(map.get_name("vA")).to eq "Virginia"
      expect(map.get_name("Al")).to eq "Alabama"
    end

    it "returns nil in the event that is not passed a valid state name" do
      expect(map.get_name("FS")).to eq nil
    end

    context "when it's not passed a string" do
      it "raises an ArgumentError if it is passed an integer" do
        expect { map.get_name(3) }.to raise_error
      end

      it "raises an ArgumentError if it is passed nil" do
        expect { map.get_name(nil) }.to raise_error
      end

      it "raises an ArgumentError if it is passed a hash" do
        expect { map.get_name({}) }.to raise_error
      end
    end
  end
end
