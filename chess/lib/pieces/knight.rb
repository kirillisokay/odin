# frozen_string_literal: true

module Pieces
  class Knight < Piece

    def set_symbol
      @color == :white ? '♘' : '♞'
    end
  end
end
