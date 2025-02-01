# frozen_string_literal: true

module Pieces
  class Piece
    attr_reader :color, :symbol

    def initialize(color)
      @color = color
      @symbol = set_symbol
    end

    def set_symbol; end

    def valid_moves(board, current_position); end
  end
end
