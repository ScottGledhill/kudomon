require 'kudomon'

describe Kudomon do
  subject(:kudomon) {described_class.new}

  it 'initializes with coordinates at 0,0' do
    expect(kudomon.coordinates).to eq [0,0]
  end
end
