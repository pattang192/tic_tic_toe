# main.rb

require "rubocop"
require_relative "lib/player"

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

box = [21, 27, 33, 75, 81, 87, 129, 135, 141] # indices of board's playable spots

player1 = Player.new("Player 1", "X")
player2 = Player.new("Player 2", "O")

players = [player1, player2]

def play_game(players, board, box)
  loop do
    players.each do |player|
      play_position = player.get_play_position(board, box)
      player.set_play_position(play_position, player.symbol, board, box)
      if player.game_over?(board, player.symbol)
        player.declare_winner(board, player.symbol)
        end_game(board, players, box)
      end
    end
  end
end

def end_game(board, players, box)
  clear_board(board)
  puts "Play again? y/n"
  play_again = gets.chomp
  if play_again == "y" then play_game(players, board, box)
  else exit
  end
end

play_game(players, board, box)
