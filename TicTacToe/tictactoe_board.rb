# tracks board state, x's and o's
# also tracks and communicates win states

class TicTacToeBoard
  WIN_STATES = [[0, 1, 2],
                [3, 4, 5],
                [6, 7, 8],
                [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8],
                [0, 4, 8],
                [2, 4, 6]].freeze
  
  attr_accessor :state

  def initialize
    @state = [nil, nil, nil, 
              nil, nil, nil, 
              nil, nil, nil]
  end

  def display
    puts "#{display_value(@state[0])} | #{display_value(@state[1])} | #{display_value(@state[2])}"
    puts "#{display_value(@state[3])} | #{display_value(@state[4])} | #{display_value(@state[5])}"
    puts "#{display_value(@state[6])} | #{display_value(@state[7])} | #{display_value(@state[8])}"
  end
  
  private
  def display_value(input)
    return 'X' if input == 1
    return 'O' if input == 0
    return '-' if input.nil?
  end

  private
  # each win state lists the positions for 3 in a row
  # checks that those 3 positions have same values
  def won?
    WIN_STATES.each do |win_state|
      if @state[win_state[0]] == @state[win_state[1]] &&
         @state[win_state[1]] == @state[win_state[2]] &&
         @state[win_state[0]] == @state[win_state[2]] &&
         !@state[win_state[0]].nil? &&
         !@state[win_state[1]].nil?
        return true
      end
    end
    false
  end

  public
  def outcome?
    if won?
      0
    elsif @state.all? { |e| !e.nil? }
      1
    else
      false
    end
  end
end
