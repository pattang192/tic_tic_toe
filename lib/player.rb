# player.rb

require_relative "tic_tac_toe"

# Creates players
class Player
  attr_reader :name, :symbol

  include TicTacToe
  def initialize(name, symbol)
    @symbol = symbol
    @name = name
  end
end
