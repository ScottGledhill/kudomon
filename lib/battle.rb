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
    #check random string method
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

  def player1_double_damage?
    return true if player1.selected_fighter.type == 'Water' && player2.selected_fighter.type == 'Fire'
    return true if player1.selected_fighter.type == 'Fire' && player2.selected_fighter.type == 'Grass'
    return true if player1.selected_fighter.type == 'Grass' && player2.selected_fighter.type == 'Rock'
    return true if player1.selected_fighter.type == 'Rock' && player2.selected_fighter.type == 'Electric'
    return true if player1.selected_fighter.type == 'Electric' && player2.selected_fighter.type == 'Water'
    return true if player1.selected_fighter.type == 'Pyschic' && player2.selected_fighter.type != 'Pyschic'
  end

  def player2_double_damage?
    #add hash constant
    return true if player2.selected_fighter.type == 'Water' && player1.selected_fighter.type == 'Fire'
    return true if player2.selected_fighter.type == 'Fire' && player1.selected_fighter.type == 'Grass'
    return true if player2.selected_fighter.type == 'Grass' && player1.selected_fighter.type == 'Rock'
    return true if player2.selected_fighter.type == 'Rock' && player1.selected_fighter.type == 'Electric'
    return true if player2.selected_fighter.type == 'Electric' && player1.selected_fighter.type == 'Water'
    return true if player2.selected_fighter.type == 'Pyschic' && player1.selected_fighter.type != 'Pyschic'
  end
end
