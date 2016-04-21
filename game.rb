class Game
  attr_reader :game

  def initialize
    @game = Hash.new
    
    @game['total_kills'] = 0
    @players = Array.new
    @kills = Hash.new # player => n kills
  end
end
