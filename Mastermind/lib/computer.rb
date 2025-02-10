require_relative 'board'
require_relative 'code'

class ComputerCodebreaker
  def initialize(board)
    @board = board
  end

  def make_guess
    guess_history = @board.board
    keep_trying = true
    new_guess = nil
    while keep_trying
      new_guess = Array.new(Code::CODE_LENGTH).map { |_| Code::CODE_VALUES.sample }
      keep_trying = false if guess_history == [] ||
                             guess_history.all? do |old_guess| 
                               match_feedback?(old_guess, new_guess)
                             end
    end
    Code.new(new_guess)
  end

  def match_feedback?(old_info, new_code)
    old_code = old_info[0].code
    old_positions_correct = old_info[1]
    old_values_correct = old_info[2]

    shares_positions(old_code, new_code) == old_positions_correct &&
      shares_values(old_code, new_code) == old_values_correct
  end

  def shares_positions(first, second)
    first.each_with_index.reduce(0) do |acc, (val, ind)|
      acc + (val == second[ind] ? 1 : 0)
    end
  end

  def shares_values(first, second)
    first.reduce(0) do |acc, val|
      if second.count(val) > 0
        second.delete_at(second.index(val))
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
computer = ComputerCodebreaker.new

guess = computer.make_guess
until 

