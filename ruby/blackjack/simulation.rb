require_relative 'blackjack'
require_relative 'deck'
require_relative 'player'
require_relative 'dealer'

puts "Welcome to BlackJack"
puts 'What is your name?'
name = gets.chomp

player = Player.new(name)
dealer = Dealer.new
deck = Deck.new
blackjack = BlackJack.new(player, dealer, deck)
puts blackjack.new_game
