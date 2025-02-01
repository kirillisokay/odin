# frozen_string_literal: true
require_relative './piece'

module Pieces
  class Pawn < Piece
    def set_symbol
      @color == :white ? '♙' : '♟'
    end

    def valid_moves(board, current_position)
      x, y = current_position

      moves = []

      direction = @color == :white ? -1 : 1

      one_forward = [x + direction, y]
      if board.grid[one_forward[0]][one_forward[1]].nil?
        moves << one_forward

        if (x == 6 && @color == :white) || (x == 1 && @color == :black)
          two_forward = [x + (2 * direction), y]
          if board.grid[two_forward[0]][two_forward[1]].nil?
            moves << two_forward
          end
        end
      end

      [[x + direction, y - 1], [x + direction, y + 1]].each do |dx, dy|
        if dx.between?(0, 7) && dy.between?(0, 7)
          target_piece = board.grid[dx][dy]
          if target_piece && target_piece.color != @color
            moves << [dx, dy]
          end
        end
      end

      moves
    end
  end
end