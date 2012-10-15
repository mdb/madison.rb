require "spec_helper"

describe Madison do
  describe "#states" do
    it "returns a Ruby hash of state names and abbreviations" do 
      m = Madison.new
      m.states[0]['name'].should === "Alabama"
      m.states[50]['abbr'].should === "WY"
      m.states.length.should === 51 
    end
  end
  
  describe "#get_abbrev" do
    before(:each) do
      @m = Madison.new
    end

    it "returns a state's abbreviation when it's passed a state's name" do 
      @m.get_abbrev("virginia").should === "VA"
      @m.get_abbrev("west virginia").should === "WV"
    end
    
    it "returns a state's abbreviation when it's passed a state's name, indpendent of the argument's case" do 
      @m.get_abbrev("virginiA").should === "VA"
      @m.get_abbrev("AlaBama").should === "AL"
    end

    it "returns nil in the event that is not passed a valid state name" do
      @m.get_abbrev("Fake State").should === nil
    end

    it "raises an ArgumentError if it is not passed a string" do
      lambda { @m.get_abbrev(3) }.should raise_error
      lambda { @m.get_abbrev(nil) }.should raise_error
      lambda { @m.get_abbrev({}) }.should raise_error
    end
  end
  
  describe "#get_name" do
    before(:each) do
      @m = Madison.new
    end

    it "returns a state's abbreviation when it's passed a state's name" do 
      @m.get_name("va").should === "Virginia"
      @m.get_name("WV").should === "West Virginia"
    end
    
    it "returns a state's abbreviation when it's passed a state's name, indpendent of the argument's case" do 
      @m.get_name("vA").should === "Virginia"
      @m.get_name("Al").should === "Alabama"
    end

    it "returns nil in the event that is not passed a valid state name" do
      @m.get_name("FS").should === nil
    end

    it "raises an ArgumentError if it is not passed a string" do
      lambda { @m.get_name(3) }.should raise_error
      lambda { @m.get_name(nil) }.should raise_error
      lambda { @m.get_name({}) }.should raise_error
    end
  end
end
