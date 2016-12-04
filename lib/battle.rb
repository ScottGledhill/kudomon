class Battle
  attr_reader :player1, :player2, :player1hp, :player2hp, :player1cp, :player2cp, :turn

  def initialize(player1, player2)
    @player1 = player1.kudomon
    @player2 = player2.kudomon
    @player1hp = player1.kudomon[0][:HP]
    @player2hp = player2.kudomon[0][:HP]
    @player1cp = player1.kudomon[0][:CP]
    @player2cp = player2.kudomon[0][:CP]
  end

  def fight
    puts choose_kudomon
    puts random_first_move
    attack
  end

  def choose_kudomon
    "Players 1's #{player1.sample[:name]} vs Player 2's #{player2.sample[:name]}"
  end

  def random_first_move
    @turn = [player1,player2].sample
    "#{turn[0][:name]} goes first!"
  end

  def attack
    @turn == player1 ? player1_attack : player2_attack
  end

  def player1_attack
    hp = player1_double_damage? ? @player2hp = player2hp - player1cp * 2 : @player2hp = player2hp - player1cp
    puts "Player1 dealt damage to to Player2 #{hp} HP remaining"
    return "Player1 wins" if player2hp <= 0
    player2_attack
  end

  def player2_attack
    hp = player2_double_damage? ? @player1hp = player1hp - player2cp * 2 : @player1hp = player1hp - player2cp
    puts "Player2 dealt damage to Player1 #{hp} HP remaining"
    return "Player2 wins" if player1hp <= 0
    player1_attack
  end

  private

  def player1_double_damage?
    return true if player1[0][:type] == 'Water' && player2[0][:type] == 'Fire'
    return true if player1[0][:type] == 'Fire' && player2[0][:type] == 'Grass'
    return true if player1[0][:type] == 'Grass' && player2[0][:type] == 'Rock'
    return true if player1[0][:type] == 'Rock' && player2[0][:type] == 'Electric'
    return true if player1[0][:type] == 'Electric' && player2[0][:type] == 'Water'
    return true if player1[0][:type] == 'Pyschic' && player2[0][:type] != 'Pyschic'
  end

  def player2_double_damage?
    return true if player2[0][:type] == 'Water' && player1[0][:type] == 'Fire'
    return true if player2[0][:type] == 'Fire' && player1[0][:type] == 'Grass'
    return true if player2[0][:type] == 'Grass' && player1[0][:type] == 'Rock'
    return true if player2[0][:type] == 'Rock' && player1[0][:type] == 'Electric'
    return true if player2[0][:type] == 'Electric' && player1[0][:type] == 'Water'
    return true if player2[0][:type] == 'Pyschic' && player1[0][:type] != 'Pyschic'
  end
end
