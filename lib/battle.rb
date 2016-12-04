class Battle
  attr_reader :player1, :player2, :player1hp, :player2hp, :player1cp, :player2cp, :first

  def initialize(player1, player2)
    @player1 = player1.kudomon
    @player2 = player2.kudomon
    @player1hp = player1.kudomon[0][:HP]
    @player2hp = player2.kudomon[0][:HP]
    @player1cp = player1.kudomon[0][:CP]
    @player2cp = player2.kudomon[0][:CP]
  end

  def fight
    versus
    random_first_move
  end

  def versus
    "#{player1.sample[:name]} vs #{player2.sample[:name]}"
  end

  def random_first_move
    @first = [player1,player2].sample
    "#{first[0][:name]} goes first!"
  end

  def attack
    p first
  end
end
