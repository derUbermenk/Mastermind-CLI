
require_relative 'display'

# contains all methods for a player object
# assumes player to be human
class Player
  include Display

  # prompts player for code, then checks and formats it 
  #
  # @param choices [Array] a string array of 6 num literals
  # @return [Array] the 4 num literals chosen
  def encode(choices)
    report_ask_for_code
    code = gets.chomp.split('')

    unless in?(choices, code)
      report_invalid_code
      encode(choices)
    end

    code
  end

  # prompts player for input 
  # other params are for ease, as ai will also have
  # ... the same method
  #
  # @param last_guess [Array] the last guess of decoder
  # @param last_acc [Array] the last accuracy of the guess
  # @param choices [Array] the available numerals allowed for input
  # @return [Array]
  def decode(choices, last_guess = nil, last_acc = nil)

    report_possible_choices(choices)
    code = ask_for_input

    return code if code == ['z']

    until in?(choices, code) && code.length.eql?(4)
      report_invalid_code
      code = ask_for_input
    end

    code
  end

  # checks last_guess against the code
  #
  # @param last_guess [Array] the guess for the code
  # @param code [Array] the actual code
  # @return [Array] array of symbols indicating accuracy
  def evaluate(last_guess, code)
    return Array.new(4,'+') if last_guess == code


    accuracy = last_guess.map.with_index { |item, position| check_presence(item, position, code) }
    accuracy.shuffle
  end

  private

  # asks for player input
  #
  # @return [Array]
  def ask_for_input
    report_ask_for_input
    input = gets.chomp.downcase

    # proceed to distinguishing if input
    # ... falls within choices
    code = input.split('')
  end

  # checks if all of elements in code is in choices
  #
  # @param choices [Array] array of possible elements allowed in code
  # @param code [Array] we check code if it contains only the possible choices for code 
  # @return [TrueClass, FalseClass]
  def in?(choices, code)
    # if empty, then all elements in code is in choices
    # as per substraction in sets, all elements that are both in code in choices are cancelled
    # ... out. leaving original code with elements that are not in choices
    (code - choices).empty?
  end

  # checks if an element is in code[Array] and returns
  # ... a string to signify accuracy of the elements position
  # ... within code
  #
  # @param item [String]
  # @param position [Integer] position of integer in guess
  # @param code [Array] strings that must be guessed
  # @return [String] accuracy indicator
  def check_presence(item, position, code)
    actual_position = code.find_index(item)

    if actual_position.nil?
      'x'
    elsif actual_position == position
      '+'
    elsif actual_position != position
      '-'
    end
  end
end

# a sub class of player with automated methods
# ... for decoding and encoding
class AI < Player
  # computer picks randomly from choices
  #
  # @param choices [Array] an array of possible choices
  def encode(choices)
    Array.new(4) { choices[rand(0..3)] }
  end

  # still unable to decide
  def decode(choices, last_guess, last_accuracy) end
end
