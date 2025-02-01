require_relative '../lib/game'
require_relative '../lib/serialization'

RSpec.describe Serialization do
  let(:game) { Game.new }

  it 'saves and loads a game' do
    Serialization.save(game, 'test_save.yml')
    loaded_game = Serialization.load('test_save.yml')
    expect(loaded_game.board.grid).to eq(game.board.grid)
  end
end