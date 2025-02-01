# frozen_string_literal: true

require_relative 'pieces/pawn'
require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/queen'
require_relative 'pieces/king'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    setup_pieces
  end

  def setup_pieces
    # Place pieces in their starting positions
    @grid[0] = [
      Pieces::Rook.new(:black), Pieces::Knight.new(:black), Pieces::Bishop.new(:black), Pieces::Queen.new(:black),
      Pieces::King.new(:black), Pieces::Bishop.new(:black), Pieces::Knight.new(:black), Pieces::Rook.new(:black)
    ]
    @grid[1] = Array.new(8) { Pieces::Pawn.new(:black) }
    @grid[6] = Array.new(8) { Pieces::Pawn.new(:white) }
    @grid[7] = [
      Pieces::Rook.new(:white), Pieces::Knight.new(:white), Pieces::Bishop.new(:white), Pieces::Queen.new(:white),
      Pieces::King.new(:white), Pieces::Bishop.new(:white), Pieces::Knight.new(:white), Pieces::Rook.new(:white)
    ]
  end

  def display
    @grid.each_with_index do |row, i|
      puts "#{8 - i} #{row.map { |piece| piece ? piece.symbol : '·' }.join(' ')}"
    end
    puts '  a b c d e f g h'
  end

  def move_piece(start_pos, end_pos)
    piece = @grid[start_pos[0]][start_pos[1]]
    if piece && piece.valid_moves(self, start_pos).include?(end_pos)
      @grid[end_pos[0]][end_pos[1]] = piece
      @grid[start_pos[0]][start_pos[1]] = nil
    else
      raise 'Invalid move'
    end
  end
end