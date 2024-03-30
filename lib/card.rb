class Card
  include Comparable

  attr_reader :suit, :value

  VALID_SUITS = [:hearts, :diamonds, :clubs, :spades]
  VALID_VALUES = (2..14).to_a

  def initialize(suit, value)
    raise ArgumentError, 'Invalid suit' unless VALID_SUITS.include?(suit)
    raise ArgumentError, 'Invalid value' unless VALID_VALUES.include?(value)

    @suit = suit
    @value = value
  end

  def <=>(other)
    value <=> other.value
  end
end
