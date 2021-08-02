# frozen_string_literal: true
require_relative 'display'

# Contains all the logic in order to play game
class Game
  include Display

  attr_accessor :board, :code,
                :encoder, :decoder,
                :winner, :last_guess,
                :last_accuracy,
                :quit

  def initialize
    @board = Board.new
    @code = nil
    @encoder = nil
    @decoder = nil
    @winner = nil

    @last_guess = nil
    @last_accuracy = nil
    @quit = nil
  end

  def play
    initialize_players
    start
  end

  private

  <<-DOC
  use the folllowing format for defining method groups
  # METHOD GROUP: MAIN METHOD NAME
  # supporting methods
  # main method
  # END OF METHOD GROUP: MAIN METHOD NAME
  DOC

  # METHOD GROUP: initialize_player 

  # sets role chosen for human player
  def human_choose_role
    choose_role_prompt
    role = gets.chomp.upcase

    if role == 'E'
      self.encoder = Player.new
    elsif role == 'D'
      self.decoder = Player.new
    else
      report_invalid_role_input
    end
  end

  # sets role of ai
  def ai_set_role
    if self.encoder.nil?
      self.encoder = AI.new
    else
      self.decoder = AI.new
    end
  end

  # initializes players made from player choice
  def initialize_players
    human_choose_role
    ai_set_role
  end

  # END OF METHOD GROUP

  def board_full
    board.full?
  end

  def has_winner?
    !winner.nil?
  end

  def game_quit?
    !quit.nil?
  end

  def stop_conditions_met
    board_full || has_winner || game_quit 
  end


  # contains all blocks where encoder sets code
  # ... decoder initial guess
  # ... encoder evaluates guess
  def initial_guess
    encoder.encode
    self.last_guess = decoder.decode
    self.last_accuracy = encoder.evaluate(last_guess)
  end

  def keep_playing
    
  end

  # reports the cause of why the game was ended 
  def report_end_terms
    if board_full
      report_full_board
    elsif has_winner
      report_has_winner(self.winner)
    elsif game_quit
      report_game_quit
    end
  end

  def start
    initial_guess

    keep_playing until stop_conditions_met 

    report_end_terms
  end

  # the following private methods are used define shorter accessors

  def encoder
    self.encoder
  end

  def decoder
    self.decoder
  end

  def last_guess
    self.last_guess
  end

  def last_accuracy
    self.last_accuracy
  end

  def board
    self.board
  end

  def winner
    self.winner
  end

  def quit
    self.quit
  end
end