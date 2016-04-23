class Game
  attr_reader :data

  def initialize
    @data = {}

    @data['total_kills'] = 0
    @data['players'] = []
    @data['kills'] = {} # player => n kills
    @data['kill_by_means'] = {}
  end

  def add_kill_info(killer, killed, method)
    include_new_players killer, killed
    include_kill_method method

    @data['total_kills'] += 1
    if killer == '<world>'
      @data['kills'][killed] -= 1
    else
      @data['kills'][killer] += 1
    end
  end

  def include_new_players(killer, killed)
    if !@data['players'].include? killer and killer != '<world>'
      @data['players'] << killer
      @data['kills'][killer] = 0
    end
    if !@data['players'].include? killed
      @data['players'] << killed
      @data['kills'][killed] = 0
    end
  end

  def include_kill_method(method)
    if !@data['kill_by_means'].include? method
      @data['kill_by_means'][method] = 1
    else
      @data['kill_by_means'][method] += 1
    end
  end
end
