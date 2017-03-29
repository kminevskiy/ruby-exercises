module Hand
  MAX_POINTS = 21
  DEALER_LIMIT = 17

  def points
    hand.reduce(0) { |sum, card| sum + card[1] }
  end

  def total
    hand.each do |card|
      if card[0] == :Ace && points > MAX_POINTS
        card[1] = 1
      end
    end
    points
  end

  def bust?
    total > MAX_POINTS
  end

  def show_hand
    hand.map do |card|
      card[0]
    end.join(', ')
  end
end

class Participant
  include Hand

  attr_accessor :name, :hand
end

class Player < Participant
  def ask_name
    loop do
      print('Please enter your name, hero: ')
      self.name = gets.chomp.capitalize
      name.empty? ? puts('Even dead people have names!') : break
    end
  end
end

class Dealer < Participant
  def initialize
    @name = %w(Frodo Bilbo Regina Hercules Shredder).sample
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = [[:two, 2, 4], [:three, 3, 4], [:four, 4, 4], [:five, 5, 4],
              [:six, 6, 4], [:seven, 7, 4], [:eight, 8, 4], [:nine, 9, 4],
              [:ten, 10, 4], [:Jack, 10, 4], [:King, 10, 4], [:Queen, 10, 4],
              [:Ace, 11, 4]]
  end

  def non_empty_deck
    cards.select { |card| card[-1] > 0 }
  end

  def pop_from_deck(card)
    cards.each do |deck_card|
      card.each do |pick_card|
        deck_card[-1] -= 1 if deck_card[0] == pick_card[0]
      end
    end
  end

  def random_card
    card = [non_empty_deck.sample]
    pop_from_deck(card)
    card.flatten
  end

  def random_hand
    hand = [non_empty_deck.sample] + [non_empty_deck.sample]
    pop_from_deck(hand)
    hand
  end
end

class Engine
  include Hand

  attr_accessor :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  private

  def welcome_message
    puts('Welcome to Twenty-One!')
    player.ask_name
    puts("Tonight, #{player.name} and #{dealer.name} will spill some blood!")
  end

  def deal_cards
    player.hand = deck.random_hand
    dealer.hand = deck.random_hand
  end

  def show_initial_cards
    print("#{player.name}: ")
    puts("#{player.hand[0][0]}, #{player.hand[1][0]}")
    print("#{dealer.name}: ")
    puts("#{dealer.hand[0][0]}, ??")
  end

  def player_turn
    puts("Current hand: #{player.show_hand}")
    print('Will you hit[1] or stay[2]: ')
    loop do
      answer = gets.chomp
      break if answer.to_i == 2
      player.hand << deck.random_card
      puts("You hit! Hand: #{player.show_hand}")
      print("What's next? hit[1] or stay[2]: ")
    end
  end

  def dealer_turn
    loop do
      if dealer.total < DEALER_LIMIT
        dealer.hand << deck.random_card
      else
        break
      end
    end
  end

  def show_result
    if player.bust?
      puts("#{player.name} busted!, #{dealer.name} wins!")
    elsif dealer.bust?
      puts("#{dealer.name} busted!, #{player.name} wins!")
    elsif player.points > dealer.points
      puts("#{player.name} wins.")
      puts("Final score: #{player.points}:#{dealer.points}")
    else
      puts("#{dealer.name} wins.")
      puts("Final score: #{dealer.points}:#{player.points}")
    end
  end

  public

  def play
    welcome_message
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Engine.new.play
