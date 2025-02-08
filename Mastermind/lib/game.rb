require_relative 'board'
require_relative 'code'

class Game
  def initialize
    @secret_code = Code.new
    @game_board = Board.new
  end

  def play
    p @secret_code.code
    codes = ['h7dd8', 'wdd113', 'fedd', '1122', '^$ff', 'john', 'abbe', 'kllm', 'bdcc']
    
    codes.map { |s| Code.validate(s) }.filter { |v| v }.each { |c| p c.feedback(@secret_code) }

    # puts 'Provide a valid code'
    # code_guess = false

    # code_guess = Code.validate(gets.chomp) until code_guess

    # code_guess.display
    # p code_guess.frequencies

    Code.validate('abbe').feedback( Code.validate('beeb'))

    @game_board.display
  end
end
