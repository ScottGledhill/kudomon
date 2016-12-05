require 'battle'
require 'kudomon_trainer'

describe Battle do
  player1 = KudomonTrainer.new
  player2 = KudomonTrainer.new
  player1.move('n')
  player2.move('n')
  subject(:battle) {described_class.new(player1, player2)}


  context 'can create a battle with two trainers' do
    it 'initiates with two trainers and their kudomon' do
      expect(battle.player1.selected_fighter.name).to eq "Sourbulb"
      expect(battle.player2.selected_fighter.name).to eq "Sourbulb"
    end

    it 'can announce who the fight is between' do
      expect(battle.announce_fighters).to eq "Players 1's Sourbulb vs Player 2's Sourbulb"
    end

    it 'can pick a random player to go first' do
      expect(["player 1 goes first!", "player 2 goes first!"]).to include battle.random_first_move
    end
  end

  context 'fighting' do
    it 'can deal damage to kudomon' do
      expect{battle.player1_attack}.to change{battle.player2.selected_fighter.hp}
    end

    it 'can determine a winner' do
      expect(["Player1 wins", "Player2 wins"]).to include battle.fight
    end

    it 'deals double damage if weak vs type' do
      expect{battle.player2_attack}.to change{battle.player1.selected_fighter.hp}
    end
  end
end
