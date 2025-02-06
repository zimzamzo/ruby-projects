class Code
  CODE_VALUES = %w[A B C D E F].freeze
  CODE_LENGTH = 4

  attr_accessor :code

  def initialize(arr = nil)
    @code = Array.new(4)

    # for empty initializations, make random
    if arr.nil?
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

  # if a valid code (includes only code values),
  # returns the code morphed into an array,
  # else returns false
  def self.validate(string)
    # translate string to array of uppercase characters
    arr = string.split('').map { |v| v.upcase }

    return Code.new(arr) if arr.all? { |v| CODE_VALUES.include?(v) } &&
                            arr.length == CODE_LENGTH

    return false
  end

  def display
    p @code
  end
end
