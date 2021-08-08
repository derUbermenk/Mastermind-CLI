# frozen_string_literal: true
require_relative 'display'

# contains all logic for interacting with the board
class Board
  include Display
  attr_accessor :current_row, :rows

  def initialize
    # creates empty rows initially
    @rows = Array.new(12) { make_row }

    # current row accesses the first empty row
    @current_row = 0
  end

  # updates board by changing row values
  #
  # @param guess [Array] the array of containing guess values
  # @param accuracy [Array] the array containing the accuracy symbols
  # ... of the guess
  def update(guess, accuracy)
    # for every update, show board
    rows[current_row] = make_row(guess, accuracy)

    show_board(self)
  end

  private

  # checks if board is full -- all rows have values of not space
  # ... this can be checked if last row has values of not space
  #
  # @return [TrueClass, FalseClass]
  def full?
    # full when all rows full

    last_row = self.rows[11]

    if last_row[:guess] == true && last_row[:accuracy] == true
      true
    else
      false
    end
  end

  # makes a hash with array values
  # ... defaults to empty row
  #
  # @param guess [Array] defaults to empty guess
  # @param accuracy [Array] defaults to empty accuracy
  # @return [Hash]
  def make_row(guess = Array.new(4, ' '),
               accuracy = Array.new(4, ' '))
    {guess: guess, accuracy: accuracy}
  end
end
