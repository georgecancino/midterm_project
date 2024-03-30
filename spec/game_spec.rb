require_relative '../lib/game'

RSpec.describe Game do
  describe '#initialize' do
    it 'creates a game with a deck of cards' do
      game = Game.new
      expect(game.deck).to be_a(Deck)
    end

    it 'starts with player 1\'s turn' do
      game = Game.new
      expect(game.current_player).to eq(1)
    end

    it 'starts with an empty pot' do
      game = Game.new
      expect(game.pot).to eq(0)
    end
  end

  describe '#next_player' do
    it 'moves to the next player' do
      game = Game.new
      game.next_player
      expect(game.current_player).to eq(2)
    end

    it 'loops back to player 1 after the last player' do
      game = Game.new
      game.next_player
      game.next_player
      expect(game.current_player).to eq(1)
    end
  end

  describe '#collect_bet' do
    it 'adds the specified amount to the pot' do
      game = Game.new
      game.collect_bet(10)
      expect(game.pot).to eq(10)
    end

    it 'increments the pot by the specified amount' do
      game = Game.new
      game.collect_bet(10)
      game.collect_bet(20)
      expect(game.pot).to eq(30)
    end
  end
end
