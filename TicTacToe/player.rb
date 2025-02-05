# Represents a player in the game.
#
# This class handles player-related attributes and actions.
class Player
  attr_reader :name, :role

  def initialize(name, role)
    @name = name
    @role = role
  end

  def choose_move(board)
    board.display
    puts "#{@name}, where would you like to choose? (1-9)"
    position = -1
    position = gets.chomp.to_i until position.between?(1, 9) &&
                                     board.state[position - 1].nil?
    puts "#{@name}, you selected #{position}"
    board.state[position - 1] = @role
  end
end
