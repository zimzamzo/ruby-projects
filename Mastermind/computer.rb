require_relative 'board'
require_relative 'code'

class ComputerCodebreaker
  def initialize

  end

  def make_guess
    keep_trying = true
    while keep_trying
      guess = Array.new(Code::CODE_LENGTH).map { |_| Code::CODE_VALUES.sample }
      # p guess
      keep_trying = false
      guess
    end
  end
end

puts ComputerCodebreaker.new.make_guess