# identifies who is playing

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

# p = Player.new('steve')

# puts "their name is #{p.name}"
