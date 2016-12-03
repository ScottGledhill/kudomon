require 'location'
include Rock

describe Location do
  subject(:location) {described_class.new}

  context 'adding random spawn locations' do
    it 'adds location to kudomon' do
      location.create_random_location
      expect(ROCK['DwayneJohnson'][:location]).to include(Fixnum)
    end
  end
end
