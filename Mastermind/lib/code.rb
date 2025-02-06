class Code
  CODE_VALUES = %w[A B C D E F].freeze

  def initialize(arr: [nil])
    @code = Array.new(4)

    # for empty initializations, make random
    if arr[0].nil?
      @code.each_with_index { |_, i| @code[i] = CODE_VALUES.sample }
    
    # otherwise copy in from input values
    else
      @code.each_with_index { |_, i| @code[i] = arr[i] }

    end
  end

  # returns array(2) where 0 tells correct value AND positions
  # and 1 tells correct values but NOT positions
  def feedback(secret_code)
  
  end
end
