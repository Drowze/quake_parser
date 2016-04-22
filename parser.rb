require_relative './game.rb'

class Parser
  attr_reader :games

  def initialize(file)
    @games = []
    @txt_array = IO.readlines(file)
  end

  def process_file
    i = 0

    while i < @txt_array.size
      if @txt_array[i].include? 'InitGame: '
        @games << Game.new
        i = process_game(i)
      end
      i += 1
    end
    @games
  end

  def process_game(i)
    game_separator = '--------------------------------------------------'
    kill_string = 'killed'

    until @txt_array[i].include? game_separator
      if @txt_array[i].include? kill_string
        kill_info = parse_kill_str @txt_array[i]

        @games[-1].add_player_info(kill_info[0], 1)
        @games[-1].add_player_info(kill_info[1])
      end
      i += 1
    end
    i
  end

  def parse_kill_str(kill_str)
    kill_str = kill_str.strip.split[5..-1].join(' ')

    killer = kill_str.split('killed')[0].strip
    killed = kill_str[/#{"killed "}(.*?)#{" by"}/m, 1]
    mean_of_death = kill_str.split[-1]

    [killer, killed, mean_of_death]
  end
end
