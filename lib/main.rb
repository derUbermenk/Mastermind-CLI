require_relative 'game'
require_relative 'player' 
require_relative 'board'
require_relative 'display'

include Display

# main function
def main

  Display.report_instructions

  keep_playing = 'y'

  while keep_playing == 'y'
    game = Game.new
    game.play

    Display.report_keep_playing_prompt
    keep_playing = gets.chomp.downcase
  end
end

# run main
main
