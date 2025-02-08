require_relative 'board'
require_relative 'code'

class Game
  NUM_TURNS = 12

  def initialize
    @secret_code = Code.new
    @game_board = Board.new
  end

  def play
    
    won = false

    puts <<~TEXT 
      Playing Mastermind

      Your job is to guess the secret in #{NUM_TURNS} or fewer rounds!
      Codes can include these characters: #{Code::CODE_VALUES.join('')}
      And will contain #{Code::CODE_LENGTH} of these characters.

      Feedback is given as filled or empty circles.
      ● means some character is exactly correct in its position.
      ◯ means some character is part of the code but in the wrong position.
      Feedback is unordered.

      The computer has selected a secret code.

    TEXT

    NUM_TURNS.times do
      puts 'What is your guess? (no spaces)'
      guess_code = nil
      guess_code = Code.validate(gets.chomp) until guess_code
      
      feedback = guess_code.feedback(@secret_code)

      @game_board.add_round(guess_code, feedback)

      @game_board.display
      
      if feedback[0] == Code::CODE_LENGTH
        won = true
        break
      end
    end

    puts 'You win! :)' if won

    puts "You did not win. :( The secret code was #{@secret_code}." unless won
  end
end
