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
    puts "Game began with #{@x_player.name} as X and #{@o_player.name} as 0!"

    current_player = nil

    9.times do |i|
      # alternate players beginning with x
      current_player = i.even? ? @x_player : @o_player

      current_player.choose_move(@board)

      # if someone has won, this will end the loop early
      break if @board.outcome?
    end

    outcome = @board.outcome?

    puts "Congratulations, #{current_player.name}, you won!" if outcome == 0

    puts 'A tie has occurred! No winner this time.' if outcome == 1
  end
end