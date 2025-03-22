# player.rb

class Player
  attr_reader :name, :symbol
  include PlayGame
  def initialize(name, symbol)
    @symbol = symbol
    @name = name
  end
end

player1 = Player.new('Player 1', 'X')
player2 = Player.new('Player 2', 'O')
