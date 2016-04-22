class Game
  attr_reader :game

  def initialize
    @game = {}

    @game['total_kills'] = 0
    @game['players'] = []
    @game['kills'] = {} # player => n kills
  end

  def add_player(player, kills = 0)
    @game['players'] << player
    @game['kills'][player] = kills
  end
end
