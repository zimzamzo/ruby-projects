require_relative 'board'
require_relative 'code'

class ComputerCodebreaker
  def initialize(board)
    @board = board
  end

  def make_guess
    history = @board.board
    keep_trying = true
    guess = nil
    while keep_trying
      new_guess = Array.new(Code::CODE_LENGTH).map { |_| Code::CODE_VALUES.sample }
      history.all? { |old_guess| match_feedback?(old_guess, new_guess) }
      keep_trying = false
    end
    guess
  end
end

puts ComputerCodebreaker.new.make_guess