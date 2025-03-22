# main.rb

require_relative 'lib'

pre_game_board = "
     |     |     
  1  |  2  |  3  
_____|_____|_____
     |     |     
  4  |  5  |  6  
_____|_____|_____
     |     |     
  7  |  8  |  9  
     |     |     
"

puts "\nIt's time for a game of Tic Tac Toe!"

puts pre_game_board

puts "\nPlayer 1 is X \nPlayer 2 is O"

module PlayGame
  def get_play_position()
    puts "#{self.name}, choose your position:"
    play_position = gets.chomp.to_i
  end
end