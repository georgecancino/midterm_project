require_relative 'hand'

class Player
  attr_reader :pot
  attr_accessor :hand

  def initialize
    @hand = Hand.new([])
    @pot = 0
  end

  def discard_cards(cards_to_discard)
    @hand.discard(cards_to_discard)
  end

  def fold
    puts "Player folds."
  end

  def see
    puts "Player sees."
  end

  def raise_bet(amount)
    puts "Player raises the bet by #{amount}."
  end
end
