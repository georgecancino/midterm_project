require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::VALID_SUITS.each do |suit|
      Card::VALID_VALUES.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal(num_cards)
    raise StandardError, 'Not enough cards in the deck' if num_cards > @cards.count

    @cards.pop(num_cards)
  end
end
