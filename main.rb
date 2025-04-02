# main.rb

require "rubocop"
require_relative "lib/player"
require_relative "lib/tic_tac_toe"

board = "
|     |     |     |
|  1  |  2  |  3  |
|_____|_____|_____|
|     |     |     |
|  4  |  5  |  6  |
|_____|_____|_____|
|     |     |     |
|  7  |  8  |  9  |
|     |     |     |
"

puts "\nIt's time for a game of Tic Tac Toe!"

puts board

puts "\nPlayer 1 is X \nPlayer 2 is O"

board_index = ["filler"]
board.chars.each_with_index do |char, i|
  board_index.push(i) if %w[1 2 3 4 5 6 7 8 9].include?(char)
end

def clear_board(board)
  board.gsub!(/[123456789XO]/, " ")
end

clear_board(board)

player1 = Player.new("Player 1", "X")
player2 = Player.new("Player 2", "O")

players = [player1, player2]

def play_game(board, board_index, players)
  loop do
    players.each do |player|
      play_position = player.get_play_position(board, board_index)
      player.set_play_position(board, board_index, play_position)
      if player.game_over?(board, board_index)
        player.declare_winner(board, board_index)
        end_game(board, board_index, players)
      end
    end
  end
end

def end_game(board, board_index, players)
  clear_board(board)
  puts "Play again? y/n"
  play_again = gets.chomp
  if play_again == "y" then play_game(board, board_index, players)
  else
    exit
  end
end

play_game(board, board_index, players)
