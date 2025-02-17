# run the game

class Hangman
  LENGTH_MIN = 5
  LENGTH_MAX = 12
  MAX_TURNS = 6

  attr_accessor :secret_word, :secret_word_array, :length, :num_turns, :letters_guessed
  
  def initialize
    @secret_word = choose_secret_word
    @secret_word_array = @secret_word.split('')
    @length = @secret_word.length
    @game_array = Array.new(@length, '_')
    @num_turns = 0
    @letters_guessed = []
  end

  def choose_secret_word
    all_words_array = File.read('lib/google-10000-english-no-swears.txt').split("\n")
    all_words_array.filter { |w| w.length.between?(LENGTH_MIN, LENGTH_MAX) }.sample
  end

  def display_intro_options
    puts %(
      What would you like to do?

      1 - Start a new game
      2 - Load the saved game
      3 - Display instructions
      )
  end

  def display_instructions
    puts %(
      A secret word is chosen. You have #{MAX_TURNS} turns to try
      and guess the word.
      
      Each turn, you can do the following:
      
      - Type a letter to find out if it is part of the word
      - Type 'save' to save and exit the game
      )
  end

  def load_game
    puts 'loading'
  end

  def start_menu
    loop do
      display_intro_options

      option = 0
      option = gets.chomp.to_i until option.between?(1, 3)

      case option
      when 1
        break
      when 2
        load_game
        break
      when 3
        display_instructions
      end
    end
  end

  def play
    puts "Hello! It's time to play Hangman!"

    # start menu, instructions
    start_menu
    # 
    # 
    # display round info (blanks, turns remaining)
    # 
    # 
    #     
  end
end