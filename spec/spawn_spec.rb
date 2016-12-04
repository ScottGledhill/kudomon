require 'spawn'
include Rock

describe Spawn do
  subject(:spawnn) {described_class.new}

  context 'adding random spawn locations' do
    it 'adds location to kudomon' do
      spawnn.create_random_spawn
      expect(ROCK['DwayneJohnson'][:location]).to include(Fixnum)
    end
  end
end
