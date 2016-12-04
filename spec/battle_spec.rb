require 'battle'

describe Battle do
  subject(:battle) {described_class.new}
  player1 = Kudomon.new
  player2 = Kudomon.new
  context 'can create a battle with two trainers' do
    it 'initiates with two trainers' do
      expect(battle.player1).to eq Kudomon
    end
  end
end
