# Contains all methods for displaying prompts and messages
module Display
  def choose_role
    puts "Choose the role you want to play as: Decoder[D] Encoder[E] \n"

    role = gets.chomp

    role unless ['D','E'].include?(role) 
  end
end
