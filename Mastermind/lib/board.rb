class Board
  attr_accessor :board
  
  def initialize
    @board = []
  end

  def display
    puts format('%-5s | %-7s | %-4s', 'Round', 'Guess', 'Feedback')
    puts '-'*26
    @board.each_with_index do |round, ind|
      # puts [round[0].to_s, "P#{round[1]}V#{round[2]}", ind + 1].join(' -- ')
      puts format('%-5d | %7s | %-4s', ind, round[0].to_s, '● ' * round[1] + '◯ ' * round[2])
    end
  end

  def add_round(code, feedback)
    @board.push([code, feedback[0], feedback[1]])
  end
end
