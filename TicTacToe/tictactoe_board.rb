# tracks board state, x's and o's
# also tracks and communicates win states
require 'pry'
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
    puts "#{@state[0].nil? ? '-' : @state[0]} | #{@state[1].nil? ? '-' : @state[1]} | #{@state[2].nil? ? '-' : @state[2]}"
    puts "#{@state[3].nil? ? '-' : @state[3]} | #{@state[4].nil? ? '-' : @state[4]} | #{@state[5].nil? ? '-' : @state[5]}"
    puts "#{@state[6].nil? ? '-' : @state[6]} | #{@state[7].nil? ? '-' : @state[7]} | #{@state[8].nil? ? '-' : @state[8]}"
  end

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
