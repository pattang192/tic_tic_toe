# player.rb

module PlayGame
  def get_play_position()
      puts "#{self.name}, choose your position:"
      play_position = gets.chomp.to_i
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

