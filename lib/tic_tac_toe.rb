# tic_tac_toe.rb

# Contains all main player methods
module TicTacToe
  def get_play_position(board, board_index)
    puts "#{name}, choose your position:"
    play_position = gets.chomp.to_i

    until play_position.between?(1, 9) && board[board_index[play_position]] == " "
      puts "Invalid input. #{name}, choose your position:"
      play_position = gets.chomp.to_i
    end
    play_position
  end

  def set_play_position(board, board_index, play_position)
    board[board_index[play_position]] = symbol
    puts board
  end

  def tic_tac_toe?(board, board_index)
    (board[board_index[1]] == symbol && board[board_index[2]] == board[board_index[1]] && board[board_index[3]] == board[board_index[2]]) ||
      (board[board_index[1]] == symbol && board[board_index[4]] == board[board_index[1]] && board[board_index[7]] == board[board_index[4]]) ||
      (board[board_index[1]] == symbol && board[board_index[5]] == board[board_index[1]] && board[board_index[9]] == board[board_index[5]]) ||
      (board[board_index[5]] == symbol && board[board_index[2]] == board[board_index[5]] && board[board_index[8]] == board[board_index[2]]) ||
      (board[board_index[5]] == symbol && board[board_index[3]] == board[board_index[5]] && board[board_index[7]] == board[board_index[3]]) ||
      (board[board_index[5]] == symbol && board[board_index[4]] == board[board_index[5]] && board[board_index[6]] == board[board_index[4]]) ||
      (board[board_index[9]] == symbol && board[board_index[8]] == board[board_index[9]] && board[board_index[7]] == board[board_index[8]]) ||
      (board[board_index[9]] == symbol && board[board_index[6]] == board[board_index[9]] && board[board_index[3]] == board[board_index[6]])
  end

  def board_full?(board, board_index)
    spaces = []
    board_index.each do |index|
      spaces.push(board[index]) if board[index] == " "
    end
    spaces.empty?
  end

  def game_over?(board, board_index)
    tic_tac_toe?(board, board_index) ||
      board_full?(board, board_index)
  end

  def declare_winner(board, board_index)
    if tic_tac_toe?(board, board_index)
      puts "#{name} wins!"
    elsif board_full?(board, board_index)
      puts "It's a draw."
    end
  end
end
