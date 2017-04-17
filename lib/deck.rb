require_relative 'card'
require 'pry'
class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_accessor :cards

  def initialize
    @cards = build_deck
  end

  def build_deck
    cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
    cards.shuffle!
  end

  def deal(num, dealer_or_player)
    dealt_card = cards.pop(num)
    #binding.pry

    puts "\n#{dealer_or_player} was dealt #{dealt_card[0].print_card}"
    return dealt_card[0]
  end
end
