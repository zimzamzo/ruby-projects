# organizes the game, players and the board

require_relative 'player'
require_relative 'tictactoe_board'

class TicTacToe
  def initialize(name1, name2)
    @x_player = Player.new(name1,1)
    @o_player = Player.new(name2,0)
    @board = TicTacToeBoard.new
  end

  def play
    puts "game began with #{@x_player.name} as X and #{@o_player.name} as O"

    # until @board.outcome?
    
    # end
    # puts 'Player 1, please choose a position for an X'
    # position = gets.chomp.to_i

    # @board.state[position] = 1

    # puts @board.won?
    # puts @board.outcome?
    @x_player.choose_move(@board)
  end

  def choose(player) end
end