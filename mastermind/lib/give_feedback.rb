class GiveFeedback
  attr_reader :secret_code

  def initialize(secret_code)
    @secret_code = secret_code
  end

  def give_feedback(guess)
    correct_position = guess.zip(@secret_code).count { |g, s| g == s }

    unmatched_guess = []
    unmatched_code = []

    guess.each_with_index do |color, index|
      if color != @secret_code[index]
        unmatched_guess << color
        unmatched_code << @secret_code[index]
      end
    end

    correct_color = unmatched_guess.tally.sum do |color, count|
      [count, unmatched_code.tally[color] || 0].min
    end

    { correct_position: correct_position, correct_color: correct_color }
  end
end
