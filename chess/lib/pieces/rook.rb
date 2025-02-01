# frozen_string_literal: true
require_relative 'piece'
module Pieces
  class Rook < Piece
    def set_symbol
      @color == :white ? '♖' : '♜'
    end
  end
end