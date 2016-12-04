class Battle
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1.kudomon
    @player2 = player2.kudomon
  end
end
