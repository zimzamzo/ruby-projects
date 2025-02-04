# organizes the game, players and the board

require_relative 'player'
require_relative 'tictactoe_board'

class TicTacToe
  def initialize(name1, name2)
    @x_player = Player.new(name1, 1)
    @o_player = Player.new(name2, 0)
    @board = TicTacToeBoard.new
  end

  def play
    puts "game began with #{@x_player.name} as X and #{@o_player.name} as 0"

    9.times do |i|
      current_player = i.even? ? @x_player : @o_player
      current_player.choose_move(@board)
    end
    puts @board.outcome?
  end
end