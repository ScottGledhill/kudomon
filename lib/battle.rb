class Battle
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1.kudomon
    @player2 = player2.kudomon
  end

  def fight
    versus
    random_first_move
  end

  def versus
    "#{player1.sample[:name]} vs #{player2.sample[:name]}"
  end

  def random_first_move
    first = [player1,player2].sample
    "#{first[0][:name]} goes first!"
  end
end
