require_relative 'board'
require_relative 'code'

class Game
  def initialize
    @secret_code = Code.new
  end

  def play
    p @secret_code.code
    codes = ['h7dd8', 'wdd113', 'fedd', '1122', '^$ff', 'john', 'abbe', 'kllm', 'bdcc']
    
    codes.each { |s| p Code.validate(s) }

    puts 'Provide a valid code'
    code_guess = false

    code_guess = Code.validate(gets.chomp) until code_guess

    code_guess.display
  end
end
