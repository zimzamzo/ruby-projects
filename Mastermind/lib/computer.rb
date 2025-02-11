# Computer finds the secret code by random guess
# Each subsequent guess must incorporate prior feedback

require_relative 'board'
require_relative 'code'


class ComputerCodebreaker
  attr_accessor :board, :attempt
  
  def initialize(board)
    @board = board
    @attempt = 0
  end

  def make_guess
    guess_history = @board.board
    new_guess = nil
    loop do
      # random
      new_guess = Array.new(Code::CODE_LENGTH).map { |_| Code::CODE_VALUES.sample }
      # stop IF first guess OR matches ALL prior feedback
      break if guess_history == [] ||
               guess_history.all? do |old_guess_info| 
                 match_feedback?(old_guess_info, new_guess)
               end
    end
    Code.new(new_guess)
  end

  # old_info = [Code object, feedback positions, feedback values]
  # new_code = Array of values
  # does this new code match feedback for old code?
  def match_feedback?(old_info, new_code)
    old_code = old_info[0].code
    old_positions_correct = old_info[1]
    old_values_correct = old_info[2]

    shares_positions(old_code, new_code) == old_positions_correct &&
      shares_values(old_code, new_code) >= old_values_correct
      shares_values(old_code, new_code) >= old_values_correct
  end

  # how many values in exact same positions
  # int
  def shares_positions(first, second)
    first.each_with_index.reduce(0) do |acc, (val, ind)|
      acc + (val == second[ind] ? 1 : 0)
    end
  end

  # compares how many values are shared between 2 arrays
  # also includes those in same position, because
  # the feedback can't guarantee those in same position
  # aren't both in the wrong spot for the secret code\
  # int
  def shares_values(first, second)
    second_copy = second.dup
    second_copy = second.dup
    first.reduce(0) do |acc, val|
      if second_copy.count(val) > 0
        second_copy.delete_at(second_copy.index(val))
      if second_copy.count(val) > 0
        second_copy.delete_at(second_copy.index(val))
        acc + 1
      else
        acc
      end
    end
  end
end

puts 'play'

secret_code = Code.new
game_board = Board.new
computer = ComputerCodebreaker.new(game_board)
computer = ComputerCodebreaker.new(game_board)

feedback = []
# guess = nil
until feedback[0] == Code::CODE_LENGTH
  guess = computer.make_guess
  feedback = guess.feedback(secret_code)
  game_board.add_round(guess, feedback)
  game_board.display
end

