# frozen_string_literal: true
require_relative '../lib/board'
require_relative '../lib/pieces/pawn'

RSpec.describe Pieces::Pawn do
  let(:board) { Board.new }
  let(:pawn) { Pieces::Pawn.new(:white) }

  describe '#valid_moves' do
    it 'returns valid moves for a white pawn at its starting position' do
      board.grid[6][0] = pawn
      expect(pawn.valid_moves(board, [6, 0])).to eq([[5, 0], [4, 0]])
    end

    it 'returns valid moves for a black pawn at its starting position' do
      black_pawn = Pieces::Pawn.new(:black)
      board.grid[1][0] = black_pawn
      expect(black_pawn.valid_moves(board, [1, 0])).to eq([[2, 0], [3, 0]])
    end

    it 'allows diagonal captures' do
      board.grid[6][0] = pawn
      board.grid[5][1] = Pieces::Pawn.new(:black)
      expect(pawn.valid_moves(board, [6, 0])).to include([5, 1])
    end
  end
end