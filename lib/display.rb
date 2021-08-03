# Contains all methods for displaying prompts and messages
module Display

  # Game Display

  def report_choose_role
    puts " \n Choose the role you want to play as: Decoder[D] Encoder[E] \n"
  end

  def report_invalid_role_input
    puts " \n Invalid role entered \n "
  end

  def report_encoder_wins
    puts " \n Encoder wins \n "
  end

  def report_decoder_wins
    puts " \n Board Full \n Decoder_wins \n "
  end

  def report_game_quit
    puts " \n Game Quit \n "
  end
end
