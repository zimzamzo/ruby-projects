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
      keep_trying = false if guess_history.all? do |old_guess| 
                               match_feedback?(old_guess, new_guess)
                             end
    end
    new_guess
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

  end
end

puts ComputerCodebreaker.new.make_guess


# 
# secret ccda
# guess 
# abcd 0 3 (A)
# aadd 1 1
# bcbd 1 1
# bacc 0 3
# acac 1 2
# 
# freq secret 1 0 2 1
# freq guesses
# 1 1 1 1
# 2 0 0 2
# 0 2 1 1
# 1 1 2 0
# 2 0 2 0
# 
# guess def 
# A1 1 -1 -1 1
# A2 -1 1 1 -1
# A3 0 0 1 -1
# A4 
# 
# remove 0s
#  1 1
#  1 0 0
#  0 0 1
#  1 1
# 
