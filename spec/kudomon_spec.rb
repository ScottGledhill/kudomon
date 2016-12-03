require 'kudomon'

describe Kudomon do
  subject(:kudomon) {described_class.new}

  context 'on creation' do
    it 'initializes with coordinates at 0,0' do
      expect(kudomon.coordinates).to eq [0,0]
    end

    it 'initializes with only one kudomon' do
      expect(kudomon.kudomon.length).to eq 1
    end

    it 'initializes with Chickapu' do
      expect(kudomon.kudomon.first).to include(:name => "Chickapu")
    end
  end

  context 'moving' do
    it 'can move south' do
      kudomon.move('s')
      expect(kudomon.coordinates).to eq [0,-1]
    end

    it 'can move north' do
      kudomon.move('n')
      expect(kudomon.coordinates).to eq [0,1]
    end

    it 'can move east' do
      kudomon.move('e')
      expect(kudomon.coordinates).to eq [1,0]
    end

    it 'can move west' do
      kudomon.move('w')
      expect(kudomon.coordinates).to eq [-1,0]
    end
  end
end
