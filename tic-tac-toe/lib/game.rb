# frozen_string_literal: true
require_relative 'board'
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
].freeze

class Game
  def initialize(player)
    @board = Board.new
    @player = player
  end

  def make_move(player_number)
    puts "#{player_number[:name]}, enter a number (1-9):"

    loop do
      input = gets.chomp
      if input.match?(/^\d+$/) && (1..9).include?(input.to_i)
        index = input.to_i - 1
        if player_move(@board.get_board, index, player_number)
        break
        end
      else
        puts 'Invalid input. Please enter a number between 1 and 9.'
      end
    end
  end

  def get_winning_combo?
    winning_combo = ::WIN_COMBINATIONS.find do |combo|
      values = @board.get_board.values_at(*combo)
      values.all?('X') || values.all?('O')
    end
    if winning_combo
      winner_symbol = @board.get_board[winning_combo[0]]
      winner_index = @player.players.find { |index, p|
        p[:symbol] == winner_symbol
      }[0]
      puts "Winning combo: #{winning_combo.map { |i| i + 1 }.join('-')}"
      puts "The winner is: #{@player.players[winner_index][:name]} (#{winner_symbol})"
    end
    winning_combo
  end

private

  def player_move(board, index, player_number)
    marker = player_number[:symbol]
    get_winning_combo?
    if board[index] != ' '
      puts 'Cell already filled. Try again.'
      return false
    end
    board[index] = marker
    @board.print_board
    true
  end
end
