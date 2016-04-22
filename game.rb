class Game
  attr_reader :game

  def initialize
    @game = {}

    @game['total_kills'] = 0
    @game['players'] = []
    @game['kills'] = {} # player => n kills
  end

  def add_player_info(player, kills = 0) # most likely kills will be 0 or 1
    unless player == '<world>'
      if @game['players'].include? player
        @game['kills'][player] += kills
      else
        @game['players'] << player
        @game['kills'][player] = kills
      end
    end
    @game['total_kills'] += kills
  end

  # rubocop:disable all
  def display_game 
    str = '{' + "\n" +
            "\ttotal_kills: " + "#{@game['total_kills']}" + "\n" +
            "\tplayers: " + "#{@game['players'].sort.to_s}" + "\n" +
            "\tkills: {" + "\n" +
              "\t\t#{@game['kills'].map{ |k,v| ret = "#{k}: #{v}"}.sort}" + "\n" +
            "\t}" + "\n" +
          "}"
    str
  end
  # rubocop:enable all
end
