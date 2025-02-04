# organizes the game, players and the board

require_relative 'player'
require_relative 'tictactoe_board'

class TicTacToe
  def initialize(name1, name2)
    @x_player = Player.new(name1)
    @o_player = Player.new(name2)
  end

  def play
    puts "game began with #{@x_player.name} as X and #{@o_player.name} as O"
  end
end
