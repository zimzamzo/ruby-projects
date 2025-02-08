class Code
  CODE_VALUES = %w[A B C D E F].freeze
  CODE_LENGTH = 4

  # protected
  attr_accessor :code, :frequencies

  def initialize(arr = nil)
    @code = Array.new(4)

    # for empty initializations, make random
    if arr.nil?
      @code.each_with_index { |_, i| @code[i] = CODE_VALUES.sample }
    
    # otherwise copy in from input values
    else
      @code.each_with_index { |_, i| @code[i] = arr[i] }

    end

    # copies unfrozen array
    @frequencies = CODE_VALUES.dup

    # saves how many of each value in code
    @frequencies.map! { |value| @code.count(value) }
  end

  # returns array(2) where 0 tells correct value AND positions
  # and 1 tells correct values but NOT positions
  def feedback(secret_code)
    correct_position_and_value = @code.each_with_index.reduce(0) do |acc, (value, index)|
      acc + (value == secret_code.code[index] ? 1 : 0)
    end

    # copies of codes removing exact matches
    # wpm = without position matches
    guess_code_wpm = @code.select.with_index { |value, index| value != secret_code.code[index] }

    secret_code_wpm = secret_code.code.select.with_index { |value, index| value != @code[index] }

    # count how many of each value in each code and add least value
    correct_value_only = CODE_VALUES.dup.reduce(0) do |acc, value|
      guess_amount = guess_code_wpm.count(value)
      secret_amount = secret_code_wpm.count(value)

      acc + (guess_amount <= secret_amount ? guess_amount : secret_amount)
    end

    [correct_position_and_value, correct_value_only]
  end

  # if a valid code string (includes only code values and proper length),
  # returns the code object,
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

  def to_s
    @code.join(' | ')
  end
end
