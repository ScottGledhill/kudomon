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

    it 'can announce who the fight is between' do
      expect(battle.choose_kudomon).to eq  "Players 1's Chickapu vs Player 2's Chickapu"
    end

    it 'can pick a random player to go first' do
      expect(battle.random_first_move).to eq 'Chickapu goes first!'
    end
  end

  context 'fighting' do

    it 'can deal damage to kudomon' do
      expect{battle.player1_attack}.to change{battle.player2hp}
    end
    
    it 'can determine a winner' do
      expect(battle.fight).to eq ''
    end
  end
end
