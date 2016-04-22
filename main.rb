require_relative './parser.rb'
require_relative './game.rb'

new_parser = Parser.new 'games.log'
games = new_parser.process_file

games.each_with_index do |game, i|

    str = ''
    game.game['kills'].each{ |k,v| str << "\t\t\"#{k}\": #{v}\n"}.sort


    # rubocop:disable all
    puts "game_#{i+1}: {\n" +
            "\ttotal_kills: " + "#{game.game['total_kills']}" + "\n" +
            "\tplayers: " + "#{game.game['players'].sort.to_s}" + "\n" +
            "\tkills: {" + "\n" +
              "#{str}" +
            "\t}\n" +
         "}"
    # rubocop:enable all

end
