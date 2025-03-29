# player.rb

module PlayGame
  def get_play_position(board, box)
    puts "#{name}, choose your position:"
    play_position = gets.chomp.to_i - 1

    until play_position.between?(0, 8) && board[box[play_position]] == " "
      puts "Invalid input. #{name}, choose your position:"
      play_position = gets.chomp.to_i - 1
    end
    play_position
  end

  def set_play_position(play_position, symbol, board, box)
    board[box[play_position]] = symbol
    puts board
  end

  def tic_tac_toe?(board, symbol)
    (board[21] == symbol && board[21] == board[27] && board[27] == board[33]) ||
      (board[75] == symbol && board[75] == board[81] && board[81] == board[87]) ||
      (board[129] == symbol && board[129] == board[135] && board[135] == board[141]) ||
      (board[21] == symbol && board[21] == board[75] && board[75] == board[129]) ||
      (board[27] == symbol && board[27] == board[81] && board[81] == board[135]) ||
      (board[33] == symbol && board[33] == board[87] && board[87] == board[141]) ||
      (board[21] == symbol && board[21] == board[81] && board[81] == board[141]) ||
      (board[33] == symbol && board[33] == board[81] && board[81] == board[129])
  end

  def game_over?(board, symbol)
    boxes = [board[21], board[27], board[33], board[75],
             board[81], board[87], board[129], board[135], board[141]]

    tic_tac_toe?(board, symbol) ||
      boxes.include?(" ") == false
  end

  def declare_winner(board, _symbol)
    boxes = [board[21], board[27], board[33], board[75],
             board[81], board[87], board[129], board[135], board[141]]
    if tic_tac_toe?(board, symbol)
      puts "#{name} wins!"
    elsif boxes.include?(" ") == false
      puts "It's a draw."
    end
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
