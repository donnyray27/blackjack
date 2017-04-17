require_relative 'deck'
require 'pry'
class Hand
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def add_card(card)
    @cards << card
  end

  def calc_aces(aces, result)
    return_value = 0
    aces.each do |ace|
      if result + 11 <= 21
        return_value += 11
        result += 11
      else
        return_value += 1
        result += 1
      end
    end
    return return_value
  end

  def calculate_hand
    regex = /[JKQ]/
    result = 0
    aces = []
    ace_value = 0
    @cards.each do |card|
      #binding.pry
      rank = card.rank.to_s
      if regex.match(rank)
          result += 10
      elsif rank == 'A'
          aces << rank
      else
        result += rank.to_i
      end
    end
    unless aces.empty?
      ace_value = calc_aces(aces, result)
    end
    return result + ace_value
  end

end

# deck = Deck.new
# player_cards = []
#
# player_cards << deck.deal(1, "Player")
# player_cards << deck.deal(2, "Player")
# player_hand = Hand.new(cards)
# hand.calculate_hand # Get this working properly
