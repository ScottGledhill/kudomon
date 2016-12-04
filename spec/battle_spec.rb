require 'battle'
require 'kudomon'

describe Battle do
  player1 = Kudomon.new
  player2 = Kudomon.new
  subject(:battle) {described_class.new(player1, player2)}

  context 'can create a battle with two trainers' do
    it 'initiates with two trainers and their kudomon' do
      expect(battle.player1.first).to include(:name => "Chickapu")
      expect(battle.player2.first).to include(:name => "Chickapu")
    end
  end
end
