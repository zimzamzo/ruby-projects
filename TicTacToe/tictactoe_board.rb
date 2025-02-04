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

  def initialize
    @state = [2, nil, nil, nil, 3, nil, nil, nil, 2]
  end

  def won?
    WIN_STATES.each do |win_state|
      if @state[win_state[0]] == @state[win_state[1]] &&
         @state[win_state[1]] == @state[win_state[2]] &&
         @state[win_state[0]] == @state[win_state[2]]
        return true
      end
    end
    false
  end
end
