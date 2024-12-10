# frozen_string_literal: true
require_relative 'lib/give_feedback'
require_relative 'lib/computer_decider'
require_relative 'lib/human_decider'
class Mastermind
  COLORS = %w[red blue green yellow white black]
  def initialize
    @secret_code = COLORS.sample(4)
    @turns = 12
    choose_how_plays
  end

  def choose_how_plays
    puts "Do you want the computer to puzzle out the colors? [Y/N]"
    loop do
      answer = gets.chomp.upcase
      case answer
      when 'Y'
        ComputerDecider.new(self, COLORS, @turns, @secret_code)
      when 'N'
        HumanDecider.new(self,COLORS, @turns, @secret_code)
      else
        puts "Invalid input. Please enter 'Y' or 'N'."
      end
    end
  end
  def valid_guess?(guess)
    guess.size == 4 && guess.all? { |color| COLORS.include?(color) }
  end
  def give_feedback(guess)
    GiveFeedback.new(@secret_code).give_feedback(guess)
  end
end

Mastermind.new