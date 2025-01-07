# frozen_string_literal: true

class ComputerDecider
  def initialize(mastermind, colors, turns, secret_code)
    @mastermind = mastermind
    @colors = colors
    @turns = turns
    @secret_code = secret_code
    play_c
  end

  def play_c
    puts "Welcome to Mastermind!"
    puts "Available colors: #{@colors.join(', ')}"
    puts "Write the colors in order as you want the computer to guess them"

    guess = gets.chomp.split
    @secret_code = guess
    if @mastermind.valid_guess?(guess)
      puts "Your mastermind table looks like this: #{@secret_code}"
      puts "Now your computer will try to figure out colors"
      computer_guess
    else
      puts "Invalid input. Please enter exactly 4 colors from the list."
    end
  end
  def computer_guess
    possibilities = generate_possibilities
    guess = @colors.sample(4)
    feedback_history = []

    puts "\nComputer has #{@turns} attempts to guess your code!"

    @turns.times do |turn|
      puts "\nTurn #{turn + 1}:"
      puts "Computer guesses: #{guess.join(' ')}"

      feedback = @mastermind.give_feedback(guess)
      puts "Feedback: #{feedback[:correct_position]} correct positions, #{feedback[:correct_color]} correct colors in wrong positions"

      if feedback[:correct_position] == 4
        puts "Computer cracked the code: #{guess.join(' ')}"
        return
      end

      feedback_history << { guess: guess, feedback: feedback }

      possibilities.select! do |possibility|
        feedback_history.all? do |past_feedback|
          given_feedback = @mastermind.give_feedback(possibility)
          given_feedback[:correct_position] == past_feedback[:feedback][:correct_position] &&
            given_feedback[:correct_color] == past_feedback[:feedback][:correct_color]
        end
      end

      puts "Remaining possibilities: #{possibilities.size}"

      if possibilities.empty?
        puts "No valid possibilities left. Something went wrong."
        return
      end

      guess = possibilities.sample
    end

    puts "\nThe computer couldn't guess your code in #{@turns} turns. You win!"
  end

  def generate_possibilities
    @colors.repeated_permutation(4).to_a
  end

  def consistent_with_feedback?(possibility, feedback)
    given_feedback = @mastermind.give_feedback(possibility)
    given_feedback[:correct_position] == feedback[:correct_position] &&
      given_feedback[:correct_color] == feedback[:correct_color]
  end
end
