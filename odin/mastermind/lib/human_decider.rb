# frozen_string_literal: true

class HumanDecider
  def initialize(mastermind, colors, turns, secret_code)
    @mastermind = mastermind
    @colors = colors
    @turns = turns
    @secret_code = secret_code
    play_h
  end
  def play_h
    puts "Welcome to Mastermind!"
    puts "Available colors: #{@colors.join(', ')}"
    puts "Try to guess the secret code. You have #{@turns} attempts."

    @turns.times do |turn|
      puts "\nTurn #{turn + 1}: Enter your guess (e.g., 'red blue green yellow')"
      guess = gets.chomp.split

      if @mastermind.valid_guess?(guess)
        feedback = @mastermind.give_feedback(guess)
        puts "Feedback: #{feedback[:correct_position]} correct positions, #{feedback[:correct_color]} correct colors in wrong positions"

        if feedback[:correct_position] == 4
          puts "Congratulations! You cracked the code: #{@secret_code.join(' ')}"
          return
        end
      else
        puts "Invalid input. Please enter exactly 4 colors from the list."
      end
    end

    puts "You've run out of turns! The secret code was: #{@secret_code.join(' ')}"
  end
end
