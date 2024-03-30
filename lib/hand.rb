require_relative 'card'

class Hand
  attr_reader :cards

  HAND_RANKINGS = {
    royal_flush: 10,
    straight_flush: 9,
    four_of_a_kind: 8,
    full_house: 7,
    flush: 6,
    straight: 5,
    three_of_a_kind: 4,
    two_pair: 3,
    one_pair: 2,
    high_card: 1
  }.freeze

  def initialize(cards)
    @cards = cards
  end

  def evaluate
    HAND_RANKINGS.each do |hand_strength, _|
      return hand_strength if send("#{hand_strength}?")
    end
    :high_card
  end

  def compare(other_hand)
    self_ranking = HAND_RANKINGS[evaluate]
    other_ranking = HAND_RANKINGS[other_hand.evaluate]

    return self_ranking <=> other_ranking if self_ranking != other_ranking

    compare_cards(self.cards, other_hand.cards)
  end

  def discard(cards_to_discard)
    @cards -= cards_to_discard
  end

  private

  def compare_cards(cards1, cards2)
    cards1.sort.reverse_each.with_index do |card1, index|
      return card1.value <=> cards2[index].value if card1.value != cards2[index].value
    end
    0 # Return 0 (tie), if all cards are equal
  end

  def royal_flush?
    straight_flush? && cards.map(&:value).min == 10
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    cards.group_by(&:value).any? { |_, group| group.length == 4 }
  end

  def full_house?
    cards.group_by(&:value).values.map(&:length).sort == [2, 3]
  end

  def flush?
    cards.map(&:suit).uniq.length == 1
  end

  def straight?
    values = cards.map(&:value)
    (values.min..values.max).to_a == values.sort
  end

  def three_of_a_kind?
    cards.group_by(&:value).any? { |_, group| group.length == 3 }
  end

  def two_pair?
    cards.group_by(&:value).values.count { |group| group.length == 2 } == 2
  end

  def one_pair?
    cards.group_by(&:value).any? { |_, group| group.length == 2 }
  end

  def high_card?
    true
  end
end
