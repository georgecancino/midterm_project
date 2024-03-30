require_relative '../lib/card'

RSpec.describe Card do
  describe '#initialize' do
    context 'with valid suit and value' do
      it 'creates a card with the specified suit and value' do
        card = Card.new(:hearts, 10)
        expect(card.suit).to eq(:hearts)
        expect(card.value).to eq(10)
      end
    end

    context 'with invalid suit or value' do
      it 'raises an ArgumentError for invalid suit' do
        expect { Card.new(:invalid_suit, 10) }.to raise_error(ArgumentError)
      end

      it 'raises an ArgumentError for invalid value' do
        expect { Card.new(:hearts, 15) }.to raise_error(ArgumentError)
      end
    end
  end
end
