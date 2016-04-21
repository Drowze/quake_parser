class Game
  attr_reader :game

  def initialize
    @game = Hash.new
    
    @game['total_kills'] = 0
    @game['players'] = Array.new
    @game['kills'] = Hash.new # player => n kills
  end

  def add_player player, kills=0
    @game['players'] << player
    @game['kills'][player] = kills
  end
end
