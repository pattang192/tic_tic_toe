# player.rb

module PlayGame
  def get_play_position(game_board, boxes)
      puts "#{self.name}, choose your position:"
      play_position = gets.chomp.to_i - 1

      until play_position.between?(0, 8) && boxes[play_position] == " "
        puts "Invalid input. #{self.name}, choose your position:"
        play_position = gets.chomp.to_i - 1
      end
      play_position
    end

  def set_play_position(play_position, symbol, game_board)
    box = [21, 27, 33, 75, 81, 87, 129, 135, 141] # indices game board's playable spots
    game_board[box[play_position]] = symbol

    puts game_board
  end

  def tic_tac_toe?(game_board, symbol)
      game_board[21] == symbol && game_board[21] == game_board[27] && game_board[27] == game_board[33] ||
      game_board[75] == symbol && game_board[75] == game_board[81] && game_board[81] == game_board[87] ||
      game_board[129] == symbol && game_board[129] == game_board[135] && game_board[135] == game_board[141] ||
      game_board[21] == symbol && game_board[21] == game_board[75] && game_board[75] == game_board[129] ||
      game_board[27] == symbol && game_board[27] == game_board[81] && game_board[81] == game_board[135] ||
      game_board[33] == symbol && game_board[33] == game_board[87] && game_board[87] == game_board[141] ||
      game_board[21] == symbol && game_board[21] == game_board[81] && game_board[81] == game_board[141] ||
      game_board[33] == symbol && game_board[33] == game_board[81] && game_board[81] == game_board[129]   
  end

  end

class Player
  attr_reader :name, :symbol
  include PlayGame
  def initialize(name, symbol)
    @symbol = symbol
    @name = name
  end
end
