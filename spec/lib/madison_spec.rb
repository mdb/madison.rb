require "spec_helper"

describe Madison do
  it 'exists as a module' do
    expect(Madison.class).to eq Module
  end

  describe '#states' do
    it 'returns an array of hashes representing each US state' do
      expect(Madison.states.length).to eq 51
    end

    context 'each hash in the array' do
      it 'contains a "name" key, the value of which is a state name' do
        expect(Madison.states[0]['name']).to eq "Alabama"
      end

      it 'contains an "abbr" key, the value of which is a state abbreviation' do
        expect(Madison.states[50]['abbr']).to eq "WY"
      end
    end

    describe '#get_abbrev' do
      it "returns a state's abbreviation when it's passed a state's name" do
        expect(Madison.get_abbrev("virginia")).to eq "VA"
        expect(Madison.get_abbrev("west virginia")).to eq "WV"
      end

      it "returns a state's abbreviation when it's passed a state's name, indpendent of the argument's case" do
        expect(Madison.get_abbrev("virginiA")).to eq "VA"
        expect(Madison.get_abbrev("AlaBama")).to eq "AL"
      end

      it 'returns nil in the event that is not passed a valid state name' do
        expect(Madison.get_abbrev('Fake State')).to eq nil
      end

      context 'when it is not passed a string' do
        it 'raises an argument error when it is passed an integer' do
          expect { Madison.get_abbrev(3) }.to raise_error
        end

        it 'raises an argument error when it is passed nil' do
          expect { Madison.get_abbrev(nil) }.to raise_error
        end

        it 'raises an ArgumentError if it is passed a hash' do
          expect { Madison.get_abbrev({}) }.to raise_error
        end
      end
    end

    describe "#get_name" do
      it "returns a state's abbreviation when it's passed a state's name" do
        expect(Madison.get_name("va")).to eq "Virginia"
        expect(Madison.get_name("WV")).to eq "West Virginia"
      end

      it "returns a state's abbreviation when it's passed a state's name, indpendent of the argument's case" do
        expect(Madison.get_name("vA")).to eq "Virginia"
        expect(Madison.get_name("Al")).to eq "Alabama"
      end

      it "returns nil in the event that is not passed a valid state name" do
        expect(Madison.get_name("FS")).to eq nil
      end

      context "when it is not passed a string" do
        it "raises an ArgumentError if it is passed an integer" do
          expect { Madison.get_name(3) }.to raise_error
        end

        it "raises an ArgumentError if it is passed nil" do
          expect { Madison.get_name(nil) }.to raise_error
        end

        it "raises an ArgumentError if it is passed a hash" do
          expect { Madison.get_name({}) }.to raise_error
        end
      end
    end
  end

  context 'the methods it provides a class when it is mixed into the class' do
    include Madison

    describe '#states' do
      it 'returns an array of state names & abbreviations' do
        expect(states.length).to eq 51
      end

      context 'each hash in the states array' do
        it 'has a "name" key' do
          expect(states[0]['name']).to eq 'Alabama'
        end

        it 'has an "abbrev" key' do
          expect(states[0]['abbr']).to eq 'AL'
        end
      end
    end

    describe '#state_name' do
      context 'when it is passed an abbreviation' do
        it 'returns the correct state name' do
          expect(state_name 'va').to eq 'Virginia'
        end
      end

      context 'when it is passed an invalid abbreviation' do
        it 'returns nil' do
          expect(state_name 'xx').to eq nil
        end
      end

      context 'when it is not passed an argument' do
        it 'raises an error' do
          expect { state_name }.to raise_error
        end
      end
    end

    describe '#state_abbrev' do
      context 'when it is passed a state name' do
        it 'returns the correct state abbreviation' do
          expect(state_abbrev 'virginia').to eq 'VA'
        end
      end

      context 'when it is passed an invalid name' do
        it 'returns nil' do
          expect(state_abbrev 'fake_state').to eq nil
        end
      end

      context 'when it is not passed an argument' do
        it 'raises an error' do
          expect { state_abbrev }.to raise_error
        end
      end
    end

    describe '#madison_map' do
      it 'returns an instance of a Madison::Map class' do
        expect(madison_map.class).to eq Madison::Map
      end
    end
  end
end
