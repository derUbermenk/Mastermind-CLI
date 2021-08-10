# Contains all methods for displaying prompts and messages
module Display

  # main Display

  def report_instructions
    puts " \n INSTRUCTIONS: \n  X - one number not in code \n  + - one number in code and in right place \n  - - one number in code but wrong place \n "
  end

  def report_keep_playing_prompt
    print " \n Do you want to play another game? [Yes[y] No[n]]: "
  end


  # Game Display

  def report_choose_role
    print " \n Choose the role you want to play as: Decoder[D] Encoder[E]: "
  end

  def report_invalid_role_input
    puts " \n Invalid role entered \n "
  end

  def report_encoder_wins(code)
    puts " \n Encoder wins, \n code is: #{code.join(' ')} "
  end

  def report_decoder_wins
    puts " \n Decoder_wins \n "
  end

  def report_game_quit
    puts " \n Game Quit \n "
  end

  # Player Display

  def report_ask_for_code
    print " \n enter code: "
  end

  def report_invalid_code
    puts " \n Invalide code entered, enter another code"
  end

  def report_possible_choices(choices)
    puts " \n Choices: #{choices.join(' ')}"
  end

  def report_ask_for_input
    print ' enter guess: '
  end

  # Board display

  # Shows formatted board rows
  # @param board [Board]
  def show_board(board)
    puts (" \n       Guess             Accuracy \n ")
    puts board.rows.map { |row| format_row(row) }.join("\n")
  end

  # formats a row for display
  #
  # @param row [Hash] contains row guess and accuracy
  def format_row(row)
    " #{row[:guess].join(' | ')}   ||   #{row[:accuracy].join(' | ')} "
  end
end
