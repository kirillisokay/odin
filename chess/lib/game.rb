# frozen_string_literal: true

require_relative 'board'
require_relative 'serialization'

class Game
  attr_reader :board, :current_player

  def initialize
    @board = Board.new
    @current_player = :white
  end

  def play
    loop do
      board.display
      puts "#{current_player.capitalize}'s turn"
      start_pos, end_pos = get_move
      board.move_piece(start_pos, end_pos)
      switch_player
    end
  end

  def get_move
    puts 'Enter start position (e.g., a2):'
    start_pos = parse_position(gets.chomp)
    puts 'Enter end position (e.g., a4):'
    end_pos = parse_position(gets.chomp)
    [start_pos, end_pos]
  end

  def parse_position(input)
    x = 8 - input[1].to_i
    y = input[0].ord - 'a'.ord
    [x, y]
  end

  def switch_player
    @current_player = @current_player == :white ? :black : :white
  end

  def save_game(filename)
    Serialization.save(self, filename)
  end

  def self.load_game(filename)
    Serialization.load(filename)
  end
end