require 'kudomon_trainer'

describe KudomonTrainer do
  subject(:kudomon_trainer) {described_class.new}

  context 'on creation' do
    it 'initializes with coordinates at 0,0' do
      expect(kudomon_trainer.coordinates).to eq [0,0]
    end
  end

  context 'moving' do
    it 'can move south' do
      kudomon_trainer.move('s')
      expect(kudomon_trainer.coordinates).to eq [0,-1]
    end

    it 'can move north' do
      kudomon_trainer.move('n')
      expect(kudomon_trainer.coordinates).to eq [0,1]
    end

    it 'can move east' do
      kudomon_trainer.move('e')
      expect(kudomon_trainer.coordinates).to eq [1,0]
    end

    it 'can move west' do
      kudomon_trainer.move('w')
      expect(kudomon_trainer.coordinates).to eq [-1,0]
    end
  end

  context 'finding kudomon' do
    it 'can check if a kudomon is not at these coordinates' do
      expect(kudomon_trainer.move('w')).to eq 'Nothing here'
    end

    it 'can check if a kudomon is at these coordinates and add to collection' do
      expect(kudomon_trainer.move('n')).to eq 'Sourbulb was added to your collection'
    end

    it 'can not catch the same kudomon twice' do
      kudomon_trainer.move('n')
      kudomon_trainer.move('s')
      kudomon_trainer.move('n')
      expect(kudomon_trainer.kudomon.length). to eq 1
    end
  end
end
