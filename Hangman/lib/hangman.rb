# run the game

class Hangman
  LENGTH_MIN = 5
  LENGTH_MAX = 12

  attr_accessor :secret_word, :length, :num_tries, :guesses_letters
  
  def initialize
    @secret_word = choose_secret_word
    @length = @secret_word.length
    @game_array = Array.new(@length, '_')
    @num_tries = 0
    @guesses_letters = []
  end

  def choose_secret_word
    all_words_array = File.read('lib/google-10000-english-no-swears.txt').split("\n")
    all_words_array.filter { |w| w.length.between?(LENGTH_MIN, LENGTH_MAX) }.sample
  end

  def play
    puts 'started'
    puts @secret_word
    p @game_array
  end
end