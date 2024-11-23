# frozen_string_literal: true
class Player
  attr_reader :players

  def initialize
    @players = {}
  end

  def take_name
    2.times do |i|
      puts "Player #{i + 1}, what is your name?"
      name = gets.chomp
      symbol = i.zero? ? 'X' : 'O'
      @players[i] = { name: name, symbol: symbol }
    end
    display_players
  end

  private

  def display_players
    @players.each do |index, player|
      puts "Player #{index + 1} is #{player[:name]} and plays as #{player[:symbol]}"
    end
  end
end
