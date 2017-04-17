require "spec_helper"

RSpec.describe Card do
  let(:card) {Card.new('A', '♥')}
  let(:card2) {Card.new('K', '♥')}
  let(:card3) {Card.new('10', '♥')}
  describe "#card_type" do
    it "returns an ace if the rank is an ace" do
      expect(card.card_type). to eq "Ace"
    end
  end

  describe "#card_type" do
    it "returns face card if the rank is a face card" do
      expect(card2.card_type). to eq "Face Card"
    end
  end

  describe "#card_type" do
    it "returns the rank value if the rank is a number card" do
      expect(card3.card_type). to eq "Rank Value: 10"
    end
  end

end
