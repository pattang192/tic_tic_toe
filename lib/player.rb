# player.rb

module PlayGame
  def get_play_position(game_board)

    boxes = [game_board[21], game_board[27], game_board[33], game_board[75],
    game_board[81], game_board[87], game_board[129], game_board[135], game_board[141]]

      puts "#{self.name}, choose your position:"
      play_position = gets.chomp.to_i

      until play_position.between?(1, 9) && boxes[play_position-1] == " "
        puts "Invalid input. #{self.name}, choose your position:"
        play_position = gets.chomp.to_i
      end

      play_position

    end

  def set_play_position(play_position, symbol, game_board)
    case play_position
    when 1
      game_board[21] = symbol
    when 2
      game_board[27] = symbol
    when 3
      game_board[33] = symbol
    when 4
      game_board[75] = symbol
    when 5
      game_board[81] = symbol
    when 6
      game_board[87] = symbol
    when 7
      game_board[129] = symbol
    when 8
      game_board[135] = symbol
    when 9
      game_board[141] = symbol
    end
    puts game_board
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

