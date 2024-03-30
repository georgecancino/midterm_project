require_relative 'deck'
require_relative 'player'

class Game
  attr_reader :deck, :current_player, :pot

  def initialize
    @deck = Deck.new
    @current_player = 1
    @pot = 0
  end

  def next_player
    @current_player = (@current_player % 2) + 1
  end

  def collect_bet(amount)
    @pot += amount
  end
end
