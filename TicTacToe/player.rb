# Represents a player in the game.
#
# This class handles player-related attributes and actions.
class Player
  attr_reader :name, :role

  def initialize(name, role)
    @name = name
    @role = role
  end
end
