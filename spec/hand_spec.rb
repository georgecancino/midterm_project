require_relative '../lib/hand'
require_relative '../lib/card'

RSpec.describe Hand do
  describe '#evaluate' do
    context 'when identifying hand strengths' do
      it 'identifies a royal flush' do
        cards = [
          Card.new(:hearts, 10),
          Card.new(:hearts, 11),
          Card.new(:hearts, 12),
          Card.new(:hearts, 13),
          Card.new(:hearts, 14)
        ]
        hand = Hand.new(cards)
        expect(hand.evaluate).to eq(:royal_flush)
      end

      it 'identifies a straight flush' do
        cards = [
          Card.new(:hearts, 6),
          Card.new(:hearts, 7),
          Card.new(:hearts, 8),
          Card.new(:hearts, 9),
          Card.new(:hearts, 10)
        ]
        hand = Hand.new(cards)
        expect(hand.evaluate).to eq(:straight_flush)
      end

      it 'identifies a four of a kind' do
        cards = [
          Card.new(:hearts, 6),
          Card.new(:diamonds, 6),
          Card.new(:clubs, 6),
          Card.new(:spades, 6),
          Card.new(:hearts, 10)
        ]
        hand = Hand.new(cards)
        expect(hand.evaluate).to eq(:four_of_a_kind)
      end

      it 'identifies a full house' do
        cards = [
          Card.new(:hearts, 6),
          Card.new(:diamonds, 6),
          Card.new(:clubs, 6),
          Card.new(:spades, 10),
          Card.new(:hearts, 10)
        ]
        hand = Hand.new(cards)
        expect(hand.evaluate).to eq(:full_house)
      end

      it 'identifies a flush' do
        cards = [
          Card.new(:hearts, 2),
          Card.new(:hearts, 4),
          Card.new(:hearts, 6),
          Card.new(:hearts, 8),
          Card.new(:hearts, 10)
        ]
        hand = Hand.new(cards)
        expect(hand.evaluate).to eq(:flush)
      end

      it 'identifies a straight' do
        cards = [
          Card.new(:hearts, 6),
          Card.new(:diamonds, 7),
          Card.new(:clubs, 8),
          Card.new(:spades, 9),
          Card.new(:hearts, 10)
        ]
        hand = Hand.new(cards)
        expect(hand.evaluate).to eq(:straight)
      end

      it 'identifies a three of a kind' do
        cards = [
          Card.new(:hearts, 6),
          Card.new(:diamonds, 6),
          Card.new(:clubs, 6),
          Card.new(:spades, 8),
          Card.new(:hearts, 10)
        ]
        hand = Hand.new(cards)
        expect(hand.evaluate).to eq(:three_of_a_kind)
      end

      it 'identifies a two pair' do
        cards = [
          Card.new(:hearts, 6),
          Card.new(:diamonds, 6),
          Card.new(:clubs, 8),
          Card.new(:spades, 8),
          Card.new(:hearts, 10)
        ]
        hand = Hand.new(cards)
        expect(hand.evaluate).to eq(:two_pair)
      end

      it 'identifies a one pair' do
        cards = [
          Card.new(:hearts, 6),
          Card.new(:diamonds, 6),
          Card.new(:clubs, 7),
          Card.new(:spades, 8),
          Card.new(:hearts, 10)
        ]
        hand = Hand.new(cards)
        expect(hand.evaluate).to eq(:one_pair)
      end

      it 'identifies a high card' do
        cards = [
          Card.new(:hearts, 2),
          Card.new(:diamonds, 4),
          Card.new(:clubs, 7),
          Card.new(:spades, 8),
          Card.new(:hearts, 10)
        ]
        hand = Hand.new(cards)
        expect(hand.evaluate).to eq(:high_card)
      end
    end
  end

  describe '#compare' do
    context 'when comparing two hands' do
      it 'correctly compares two hands' do
        hand1 = Hand.new([
          Card.new(:hearts, 6),
          Card.new(:hearts, 7),
          Card.new(:hearts, 8),
          Card.new(:hearts, 9),
          Card.new(:hearts, 10)
        ])
        hand2 = Hand.new([
          Card.new(:hearts, 2),
          Card.new(:hearts, 3),
          Card.new(:hearts, 4),
          Card.new(:hearts, 5),
          Card.new(:hearts, 6)
        ])
        expect(hand1.compare(hand2)).to eq(1) # hand1 WINS because it has a higher straight
      end
    end
  end
end
