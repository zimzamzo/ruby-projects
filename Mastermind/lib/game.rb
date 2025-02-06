require_relative 'board'
require_relative 'code'

class Game
  def initialize
    @secret_code = Code.new
  end

  def play
    p @secret_code.code
    p Code.validate(['F', 'A', 'E', 'B'])
  end
end
