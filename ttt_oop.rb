module Combinations
  VALUES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
            [1, 4, 7], [2, 5, 8], [3, 6, 9],
            [1, 5, 9], [3, 5, 7]].freeze
end

class Board
  attr_accessor :board
  def initialize
    reset
  end

  def reset
    @board = Hash.new
    (1..9).each { |key| board[key] = ' ' }
  end

  def modify(cell, mark)
    board[cell] = mark if board[cell] == ' '
  end

  def full?
    !board.values.include?(' ')
  end

  def cell_empty?(cell)
    board[cell] == ' '
  end

  def select_empty_cell
    empty_cell = board.keys.select do |cell|
      board[cell] == ' '
    end
    empty_cell.sample
  end

  def draw
    puts ''
    puts '     |     |'
    puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
    puts '     |     |'
  end
end

class Player
  attr_accessor :points, :name, :marker
end

class Human < Player
  def initialize
    @points = 0
  end

  def set_name
    loop do
      print('Enter your name: ')
      self.name = gets.chomp.capitalize
      if !name.empty?
        puts("Thank you, #{name}")
        break
      else
        puts('No input detected. Please try again.')
      end
    end
  end

  def set_marker
    loop do
      print('Now enter your marker[X or O]: ')
      self.marker = gets.chomp.capitalize
      break if %w(X O).include?(marker)
    end
  end

  def pick
    print("#{name}, enter a square to mark: ")
    gets.chomp.to_i
  end
end

class Computer < Player
  def initialize
    @name = %w(Joker Luthor Zoom Magneto).sample
    @points = 0
  end
end

class Engine
  attr_reader :human, :computer, :board

  def initialize
    @human = Human.new
    @computer = Computer.new
    @board = Board.new
  end

  private

  def welcome_message
    puts('Hello and welcome to the Game!')
  end

  def introduce_players
    puts("Today, we are pleased to have #{human.name} and #{computer.name}")
  end

  def supply_player_info
    human.set_name
    human.set_marker
  end

  def free_marker
    human.marker == 'X' ? 'O' : 'X'
  end

  def set_computer_marker
    computer.marker = free_marker
  end

  def human_move
    chosen_cell = human.pick
    loop do
      if board.cell_empty?(chosen_cell)
        board.modify(chosen_cell, human.marker)
        break
      else
        print('Incorrect input, try again: ')
        chosen_cell = gets.chomp.to_i
      end
    end
  end

  def computer_move
    set_computer_marker
    board.modify(board.select_empty_cell, computer.marker)
  end

  def won_round?(marker)
    squares = board.board
    Combinations::VALUES.any? do |combination|
      squares.values_at(*combination).count(marker) == 3
    end
  end

  def add_point(player)
    player.points += 1
  end

  def won_game?
    human.points == 5 || computer.points == 5
  end

  def human_won_round?
    add_point(human) if won_round?(human.marker)
  end

  def computer_won_round?
    add_point(computer) if won_round?(computer.marker)
  end

  def display_result
    puts("#{human.name} wins!") if human.points == 5
    puts("#{computer.name} wins!") if computer.points == 5
    puts("It's a tie") if board.full?
  end

  def board_reset
    board.reset
  end

  def say_goodbye
    puts('Thanks for playing. Goodbye!')
  end

  def clear_screen
    system 'clear'
  end

  def show_result
    board.draw
    display_result
  end

  def show_points
    puts("#{human.name} #{human.points} : #{computer.name} #{computer.points}")
  end

  public

  def play
    welcome_message
    supply_player_info
    introduce_players
    loop do
      loop do
        show_points
        board.draw
        human_move
        break if human_won_round? || board.full?

        computer_move
        break if computer_won_round? || board.full?
        clear_screen
      end
      show_result
      break if won_game?
      board_reset
    end
    say_goodbye
  end
end

Engine.new.play
