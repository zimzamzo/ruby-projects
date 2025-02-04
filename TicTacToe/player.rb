# Represents a player in the game.
#
# This class handles player-related attributes and actions.
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
