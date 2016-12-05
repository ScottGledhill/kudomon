class Battle
  attr_reader :player1, :player2, :turn
  attr_writer :turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    fight
  end

  def fight
    player1.randomly_choose_fighter
    player2.randomly_choose_fighter
    puts announce_fighters
    puts random_first_move
    attack
  end

  def announce_fighters
    "Players 1's #{player1.selected_fighter.name} vs Player 2's #{player2.selected_fighter.name}"
  end

  def random_first_move
    @turn = ['1', '2'].sample
    "player #{turn} goes first!"
  end

  def attack
    turn == '1' ? player1_attack : player2_attack
  end

  def player1_attack
    dealt_damage = player1_double_damage? ? player1.selected_fighter.cp * 2 : player1.selected_fighter.cp
    hp_left = player2.selected_fighter.hp -= dealt_damage
    puts "Player1 dealt #{dealt_damage} damage to Player2 #{hp_left > 0 ? hp_left : 0} HP remaining"
    return p "Player1 wins" if hp_left <= 0
    player2_attack
  end

  def player2_attack
    dealt_damage = player2_double_damage? ? player2.selected_fighter.cp * 2 : player2.selected_fighter.cp
    hp_left = player1.selected_fighter.hp -= dealt_damage
    puts "Player2 dealt #{dealt_damage} damage to Player1 #{hp_left > 0 ? hp_left : 0} HP remaining"
    return p "Player2 wins" if hp_left <= 0
    player1_attack
  end

  private

  DOUBLE_DAMAGE = {
    Water: ['Fire'],
    Fire: ['Grass'],
    Grass: ['Rock'],
    Rock: ['Electric'],
    Electric: ['Water'],
    Psychic: ['Water', 'Fire', 'Grass', 'Rock', 'Electric']
  }

  def player1_double_damage?
    DOUBLE_DAMAGE[player1.selected_fighter.type.to_sym].include?(player2.selected_fighter.type)
  end

  def player2_double_damage?
    DOUBLE_DAMAGE[player2.selected_fighter.type.to_sym].include?(player1.selected_fighter.type)
  end
end
