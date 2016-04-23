class Game
  attr_reader :game

  def initialize
    @game = {}

    @game['total_kills'] = 0
    @game['players'] = []
    @game['kills'] = {} # player => n kills
  end

  def add_kill_info(killer, killed, method)
    include_new_players(killer, killed)

    @game['total_kills'] += 1
    if killer == '<world>'
      @game['kills'][killed] -= 1
    else
      @game['kills'][killer] += 1
    end
  end

  def include_new_players(killer, killed)
    if !@game['players'].include? killer and killer != '<world>'
      @game['players'] << killer
      @game['kills'][killer] = 0
    end
    if !@game['players'].include? killed
      @game['players'] << killed
      @game['kills'][killed] = 0
    end
  end

  # rubocop:disable all
  # def display_game 
  #   str = '{' + "\n" +
  #           "\ttotal_kills: " + "#{@game['total_kills']}" + "\n" +
  #           "\tplayers: " + "#{@game['players'].sort.to_s}" + "\n" +
  #           "\tkills: {" + "\n" +
  #             "\t\t#{@game['kills'].map{ |k,v| ret = "#{k}: #{v}"}.sort}" + "\n" +
  #           "\t}" + "\n" +
  #         "}"
  #   str
  # end
  # rubocop:enable all
end
