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
    keep_trying = true
    new_guess = nil
    while keep_trying
      @attempt += 1
      # p @attempt
      new_guess = Array.new(Code::CODE_LENGTH).map { |_| Code::CODE_VALUES.sample }
      keep_trying = false if guess_history == [] ||
                             guess_history.all? do |old_guess_info| 
                               match_feedback?(old_guess_info, new_guess)
                             end
    end
    Code.new(new_guess)
  end

  def match_feedback?(old_info, new_code)
    old_code = old_info[0].code
    old_positions_correct = old_info[1]
    old_values_correct = old_info[2]

    shares_positions(old_code, new_code) == old_positions_correct &&
      shares_values(old_code, new_code) >= old_values_correct
  end

  def shares_positions(first, second)
    first.each_with_index.reduce(0) do |acc, (val, ind)|
      acc + (val == second[ind] ? 1 : 0)
    end
  end

  def shares_values(first, second)
    second_copy = second.dup
    first.reduce(0) do |acc, val|
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

puts secret_code.to_s + ' is secret code'
feedback = []
until feedback[0] == Code::CODE_LENGTH
  guess = computer.make_guess
  feedback = guess.feedback(secret_code)
  game_board.add_round(guess, feedback)
  game_board.display
end

# codes = [[1,1,1],[2,2,2],[3,3,3],[1,2,2]]

# secret = [1,2,3]

# codes.each { |c| p ComputerCodebreaker::shares_values(c,secret)}

