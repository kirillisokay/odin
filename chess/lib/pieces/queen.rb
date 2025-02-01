# frozen_string_literal: true

module Pieces
  class Queen < Piece
    def set_symbol
      @color == :white ? '♕' : '♛'
    end
  end
end