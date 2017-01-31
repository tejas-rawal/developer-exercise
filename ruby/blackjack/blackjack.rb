class Blackjack
  attr_accessor :players, :hands

  def initialize
    @dealer = Dealer.new
    @player = Player.new('Tejas')
  end
end
