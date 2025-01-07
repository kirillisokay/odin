# frozen_string_literal: true
require 'json'
class Hangman
  DICTIONARY = '10000.txt'
  SAVE_FILE = 'save.json'
  MAX_GUESSES = 6

  def initialize
    @word = select_word
    @guesses_left = MAX_GUESSES
    @correct_guesses = Array.new(@word.length, '_')
    @incorrect_guesses = []
  end

  def play
    loop do
      display_status
      puts "Guess a letter or type 'save' to save the game:"
      input = gets.chomp.downcase

      if input == 'save'
        save_game
        puts 'Game saved!'
        next
      end

      handle_guess(input)
      break if game_over?
    end
    display_result
  end

  def self.load_game
    if File.exist?(SAVE_FILE)
      data = JSON.parse(File.read(SAVE_FILE), symbolize_names: true)
      game = Hangman.new
      game.instance_variable_set(:@word, data[:word])
      game.instance_variable_set(:@guesses_left, data[:guesses_left])
      game.instance_variable_set(:@correct_guesses, data[:correct_guesses])
      game.instance_variable_set(:@incorrect_guesses, data[:incorrect_guesses])
      game
    else
      puts 'No saved game found. Starting a new game.'
      Hangman.new
    end
  end

  private

  def select_word
    words = File.readlines(DICTIONARY).map(&:chomp)
    words.select { |word| word.length.between?(5, 12) }.sample
  end

  def display_status
    puts "\nWord: #{@correct_guesses.join(' ')}"
    puts "Incorrect guesses: #{@incorrect_guesses.join(', ')}"
    puts "Guesses left: #{@guesses_left}"
  end

  def handle_guess(letter)
    if @word.include?(letter)
      @word.chars.each_with_index do |char, index|
        @correct_guesses[index] = char if char == letter
      end
    else
      @incorrect_guesses << letter unless @incorrect_guesses.include?(letter)
      @guesses_left -= 1
    end
  end

  def game_over?
    @guesses_left.zero? || !@correct_guesses.include?('_')
  end

  def display_result
    if @correct_guesses.join == @word
      puts "Congratulations! You guessed the word: #{@word}"
    else
      puts "Game over! The word was: #{@word}"
    end
  end

  def save_game
    data = {
      word: @word,
      guesses_left: @guesses_left,
      correct_guesses: @correct_guesses,
      incorrect_guesses: @incorrect_guesses
    }
    File.write(SAVE_FILE, JSON.dump(data))
  end
end

puts 'Welcome to Hangman!'
puts "Type 'load' to load a saved game or press Enter to start a new game."
input = gets.chomp.downcase

game = input == 'load' ? Hangman.load_game : Hangman.new
game.play
