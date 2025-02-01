# frozen_string_literal: true

module Pieces
  class King < Piece

    def set_symbol
      @color == :white ? '♔' : '♚'
    end
  end
end