# Represents a player in the game.
#
# This class handles player-related attributes and actions.
class Player
  attr_reader :name, :score

  def initialize(name)
    @name = name
    @score = 0
  end

  def won_round
    @score += 1
  end
end
