# organizes the game, players and the board

require_relative 'Player'
require_relative 'TicTacToeBoard'

class TicTacToe
  def initialize(x_player, o_player)
    @x_player = x_player
    @o_player = o_player
  end
end

p = Player.new('steve')

puts "their name is #{p.name}"
