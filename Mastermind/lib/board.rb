class Board
  attr_accessor :board
  
  def initialize
    @board = [  Code.validate('ffde'), Code.validate('aacc')]
  end

  def display
    @board.each do |element|
      puts element
    end
  end
end
