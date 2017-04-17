require 'pry'
class Card
  attr_reader :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit

  end

  def card_type
    case @rank
      when "A"
        'Ace'
      when "K" || "Q" || "J"
        'Face Card'
      else 
        "Rank Value: #{@rank}"
    end
  end

  def print_card
    "#{@rank}#{@suit}"
  end

end

# test_card = Card.new( 4, '♥')
# test_card.card_type
# binding.pry
