require_relative '../lib/player'
require_relative '../lib/hand'
require_relative '../lib/card'

RSpec.describe Player do
  describe '#initialize' do
    it 'creates a player with an empty hand and pot' do
      player = Player.new
      expect(player.hand.cards).to be_empty
      expect(player.pot).to eq(0)
    end
  end

  describe '#discard_cards' do
    it 'removes specified cards from the player\'s hand' do
      cards = [
        Card.new(:hearts, 2),
        Card.new(:diamonds, 3),
        Card.new(:clubs, 5),
        Card.new(:spades, 7),
        Card.new(:hearts, 9)
      ]
      player = Player.new
      player.hand = Hand.new(cards)

      player.discard_cards([cards[1], cards[3]])

      expect(player.hand.cards).not_to include(cards[1])
      expect(player.hand.cards).not_to include(cards[3])

      expect(player.hand.cards).to include(cards[0])
      expect(player.hand.cards).to include(cards[2])
      expect(player.hand.cards).to include(cards[4])
    end
  end

  describe '#fold' do
    it 'returns a message indicating that the player has folded' do
      player = Player.new
      expect { player.fold }.to output("Player folds.\n").to_stdout
    end
  end

  describe '#see' do
    it 'returns a message indicating that the player has chosen to see' do
      player = Player.new
      expect { player.see }.to output("Player sees.\n").to_stdout
    end
  end

  describe '#raise_bet' do
    it 'returns a message indicating that the player has raised the bet by the specified amount' do
      player = Player.new
      expect { player.raise_bet(10) }.to output("Player raises the bet by 10.\n").to_stdout
    end
  end
end
