require_relative '../lib/board'

RSpec.describe Board do
  let(:board) { Board.new }

  describe '#move_piece' do
    it 'moves a piece to a valid position' do
      board.move_piece([6, 0], [5, 0])
      expect(board.grid[5][0]).to be_a(Pieces::Pawn)
    end

    it 'raises an error for an invalid move' do
      expect { board.move_piece([6, 0], [4, 0]) }.to raise_error('Invalid move')
    end
  end
end