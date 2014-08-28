require "spec_helper"

describe Madison do
  it "exists as a module" do
    expect(Madison.class).to eq Module
  end

  describe "#states" do
    it "returns a Ruby hash of state names and abbreviations" do
      m = Madison

      expect(m.states[0]['name']).to eq "Alabama"
      expect(m.states[50]['abbr']).to eq "WY"
      expect(m.states.length).to eq 51
    end

    describe "#get_abbrev" do
      before(:each) do
        @m = Madison
      end

      it "returns a state's abbreviation when it's passed a state's name" do 
        expect(@m.get_abbrev("virginia")).to eq "VA"
        expect(@m.get_abbrev("west virginia")).to eq "WV"
      end

      it "returns a state's abbreviation when it's passed a state's name, indpendent of the argument's case" do 
        expect(@m.get_abbrev("virginiA")).to eq "VA"
        expect(@m.get_abbrev("AlaBama")).to eq "AL"
      end

      it "returns nil in the event that is not passed a valid state name" do
        expect(@m.get_abbrev("Fake State")).to eq nil
      end

      it "raises an ArgumentError if it is not passed a string" do
        expect { @m.get_abbrev(3) }.to raise_error
        expect { @m.get_abbrev(nil) }.to raise_error
        expect { @m.get_abbrev({}) }.to raise_error
      end
    end

    describe "#get_name" do
      before(:each) do
        @m = Madison
      end

      it "returns a state's abbreviation when it's passed a state's name" do 
        expect(@m.get_name("va")).to eq "Virginia"
        expect(@m.get_name("WV")).to eq "West Virginia"
      end

      it "returns a state's abbreviation when it's passed a state's name, indpendent of the argument's case" do 
        expect(@m.get_name("vA")).to eq "Virginia"
        expect(@m.get_name("Al")).to eq "Alabama"
      end

      it "returns nil in the event that is not passed a valid state name" do
        expect(@m.get_name("FS")).to eq nil
      end

      it "raises an ArgumentError if it is not passed a string" do
        expect { @m.get_name(3) }.to raise_error
        expect { @m.get_name(nil) }.to raise_error
        expect { @m.get_name({}) }.to raise_error
      end
    end
  end

  describe "Madison::Map" do
    it "exists as a class within the Madison module" do
      expect(Madison::Map.class).to eq Class
    end

    describe "#states" do
      it "returns a Ruby hash of state names and abbreviations" do
        m = Madison::Map.new
        expect(m.states[0]['name']).to eq "Alabama"
        expect(m.states[50]['abbr']).to eq "WY"
        expect(m.states.length).to eq 51
      end
    end

    describe "#get_abbrev" do
      before(:each) do
        @m = Madison::Map.new
      end

      it "returns a state's abbreviation when it's passed a state's name" do 
        expect(@m.get_abbrev("virginia")).to eq "VA"
        expect(@m.get_abbrev("west virginia")).to eq "WV"
      end

      it "returns a state's abbreviation when it's passed a state's name, indpendent of the argument's case" do 
        expect(@m.get_abbrev("virginiA")).to eq "VA"
        expect(@m.get_abbrev("AlaBama")).to eq "AL"
      end

      it "returns nil in the event that is not passed a valid state name" do
        expect(@m.get_abbrev("Fake State")).to be_nil
      end

      it "raises an ArgumentError if it is not passed a string" do
        expect { @m.get_abbrev(3) }.to raise_error
        expect { @m.get_abbrev(nil) }.to raise_error
        expect { @m.get_abbrev({}) }.to raise_error
      end
    end

    describe "#get_name" do
      before(:each) do
        @m = Madison::Map.new
      end

      it "returns a state's abbreviation when it's passed a state's name" do 
        expect(@m.get_name("va")).to eq "Virginia"
        expect(@m.get_name("WV")).to eq "West Virginia"
      end

      it "returns a state's abbreviation when it's passed a state's name, indpendent of the argument's case" do 
        expect(@m.get_name("vA")).to eq "Virginia"
        expect(@m.get_name("Al")).to eq "Alabama"
      end

      it "returns nil in the event that is not passed a valid state name" do
        expect(@m.get_name("FS")).to eq nil
      end

      it "raises an ArgumentError if it is not passed a string" do
        expect { @m.get_name(3) }.to raise_error
        expect { @m.get_name(nil) }.to raise_error
        expect { @m.get_name({}) }.to raise_error
      end
    end
  end
end
