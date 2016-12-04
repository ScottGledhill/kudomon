class Battle
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1.kudomon
    @player2 = player2.kudomon
  end

  def fight
    "#{player1.sample[:name]} vs #{player2.sample[:name]}"
  end

  def versus
  end
end
