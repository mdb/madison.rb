require "spec_helper"

describe Madison do
  describe "#states" do
    it "returns a Ruby hash of state names and abbreviations" do 
      Madison.states[0]['name'].should === "Alabama"
      Madison.states.length.should === "Alabama"
    end
  end
end
