require 'kudomon'

describe Kudomon do
  subject(:kudomon) {described_class.new}

  it 'initializes with coordinates at 0,0' do
    expect(kudomon.coordinates).to eq [0,0]
  end


  it 'initializes with only one kudomon' do
    expect(kudomon.kudomon.length).to eq 1
  end

  it 'initializes with Chickapu' do
    expect(kudomon.kudomon).to eq [Electric]
  end
end
