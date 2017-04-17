require_relative "card"
require_relative "deck"
require_relative "hand"
require_relative "player"
require 'pry'

class Blackjack_Table
  attr_reader :deck, :player, :dealer, :hand_at_play, :game_over, :player_stand
  def initialize
    @deck = initialize_deck
    @player = initialize_player
    @dealer = nil
    @hand_at_play = @player
    @game_over = false
    @player_stand = false
  end

  def initialize_deck
    @deck = Deck.new
  end

  def initialize_player
    print 'Please provide name: '
    name = gets.chomp
    player_cards = []
    player_cards << @deck.deal(1, name)
    player_cards << @deck.deal(1, name)
    player_hand = Hand.new(player_cards)
    @player = Player.new(name, player_hand)
    @hand_at_play = @player
    puts "\n#{@player.name}'s Score: #{@player.hand.calculate_hand}\n"
    return @player
  end

  def initialize_dealer
    dealer_cards = []
    dealer_cards << @deck.deal(1, "'Puter")
    dealer_cards << @deck.deal(1, "'Puter")
    dealer_hand = Hand.new(dealer_cards)
    @dealer = Player.new("'Puter", dealer_hand)
  end


  def valid_input(char)
    if char.downcase == 'h' || char.downcase == 's'
      return true
    else
      return false
    end
  end

  def ask_hit_or_stand
    print "Hit or Stand: "
    decision = gets.chomp
    return decision.downcase
  end

  def hit_or_stand
    decision = ask_hit_or_stand
    until valid_input(decision)
      decision = ask_hit_or_stand
    end
    if decision == 'h'
      hit
    else
      stand
    end

  end

  def switch
      @hand_at_play = @dealer
      puts "#{@hand_at_play.name}'s Score: #{@hand_at_play.hand.calculate_hand}"
  end

  def hit
    puts "#{@hand_at_play.name} hits"
    new_card = @deck.deal(1, @hand_at_play.name)
    @hand_at_play.hand.add_card(new_card)
    puts "#{@hand_at_play.name}'s Score: #{@hand_at_play.hand.calculate_hand}"
  end

  def stand
    puts "#{@hand_at_play.name} stands"
    if @player_stand == false ? @player_stand = true : @player_stand = false
    end
  end

  def calc_bust
    if @hand_at_play.hand.calculate_hand > 21
      if @hand_at_play.name == "'Puter"
        puts "House Loses. You win!"
      else
        puts "Bust! You lose"
      end
      @game_over = true
    end
  end

  def calc_score
    if 21 - @player.hand.calculate_hand < 21 - @hand_at_play.hand.calculate_hand || @hand_at_play.hand.calculate_hand > 21
      puts "You Win!"
    else
      puts "Bust! You lose"
    end
    @game_over = true
  end

end


new_table = Blackjack_Table.new

until new_table.game_over
  until new_table.player_stand
    new_table.hit_or_stand
    new_table.calc_bust
    if new_table.game_over
      break
    end
  end
  unless new_table.game_over
    new_table.initialize_dealer
    new_table.switch
    #binding.pry
    dealer_hand = new_table.hand_at_play.hand.calculate_hand
    while new_table.player_stand
      if dealer_hand < 17 && new_table.player.hand.calculate_hand > dealer_hand
        new_table.hit
        dealer_hand = new_table.hand_at_play.hand.calculate_hand
      else
        new_table.stand
        new_table.calc_bust
      end
    end
    unless new_table.game_over
      new_table.calc_score
    end
  end

end
