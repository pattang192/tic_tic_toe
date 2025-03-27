# main.rb

require_relative 'lib/player'

board = "
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

puts board

puts "\nPlayer 1 is X \nPlayer 2 is O"

def clear_board(board)
  board.gsub!(/[123456789XO]/, " ")
end

clear_board(board)

player1 = Player.new('Player 1', 'X')
player2 = Player.new('Player 2', 'O')
