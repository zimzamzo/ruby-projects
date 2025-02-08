class Board
  private

  attr_accessor :board
  
  public
  
  def initialize
    @board = []
  end

  def display
    guess_format_length = [Code::CODE_LENGTH * 2 - 1, 5].max

    format_string = "%-5s | %-#{guess_format_length}s | %-8s"
    
    puts format(format_string, 'Round', 'Guess', 'Feedback')
    puts '-' * (19 + guess_format_length)
    
    @board.each_with_index do |round, ind|
      puts format(format_string, (ind + 1).to_s, round[0].to_s, '● ' * round[1] + '◯ ' * round[2])
    end
  end

  def add_round(code, feedback)
    @board.push([code, feedback[0], feedback[1]])
  end
end
