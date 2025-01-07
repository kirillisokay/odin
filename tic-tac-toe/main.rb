# frozen_string_literal: true

require_relative './lib/ayer'
require_relative './lib/game_rules'
require_relative './lib/game'

class TicTacToe
  def initialize
    @player = Player.new
    @rules = GameRules.new
    @game = Game.new(@player)
    @counter = 0
  end

  def init
    @player.take_name
    @rules.explain_rules
    play_game
  end

  def play_game
    current_player = 0
    until game_over?
      @game.make_move(@player.players[current_player])
      @counter += 1
      current_player = (current_player + 1) % 2
    end
    return if @game.get_winning_combo?
      puts "It's a draw!"
    
  end

  def game_over?
    @game.get_winning_combo? || @counter >= 9
  end
end

tic_tac_toe = TicTacToe.new
tic_tac_toe.init
