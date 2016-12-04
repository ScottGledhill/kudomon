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
    choose_kudomon
    random_first_move
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
    @player2hp = player2hp - player1cp
    return "Player1 wins" if player2hp <= 0
    player2_attack
  end

  def player2_attack
    @player1hp = player1hp - player2cp
    return "Player2 wins" if player1hp <= 0
    player1_attack
  end
end
