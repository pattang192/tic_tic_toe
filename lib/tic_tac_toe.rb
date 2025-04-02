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

  def tic_tac_toe?(board, board_index, three_in_a_line)
    winner = []
    three_in_a_line.each do |line|
      a, b, c = line
      winner.push(name) if board[board_index[a]] == symbol && board[board_index[b]] == symbol &&
                           board[board_index[c]] == symbol
    end
    winner.any?
  end

  def board_full?(board, board_index)
    spaces = []
    board_index.each do |index|
      spaces.push(board[index]) if board[index] == " "
    end
    spaces.empty?
  end

  def game_over?(board, board_index, three_in_a_line)
    tic_tac_toe?(board, board_index, three_in_a_line) ||
      board_full?(board, board_index)
  end

  def declare_winner(board, board_index, three_in_a_line)
    if tic_tac_toe?(board, board_index, three_in_a_line)
      puts "#{name} wins!"
    elsif board_full?(board, board_index)
      puts "It's a draw."
    end
  end
end
