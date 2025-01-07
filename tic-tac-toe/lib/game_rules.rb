# frozen_string_literal: true

class GameRules
  def explain_rules
    puts 'How to play?'
    puts 'First player to get 3 in a row wins.'
    puts 'To fill a square, type the number corresponding to the square you want to play.'
    puts 'The board is numbered like this:'
    puts ' 1 | 2 | 3 '
    puts '---+---+---'
    puts ' 4 | 5 | 6 '
    puts '---+---+---'
    puts ' 7 | 8 | 9 '
  end
end
