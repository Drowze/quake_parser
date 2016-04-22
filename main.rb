require_relative './parser.rb'
require_relative './game.rb'

new_parser = Parser.new 'games.log'
games = new_parser.process_file

games.each_with_index do |game, i|
    # puts "game #{i+1}: " + game.display_game


    puts "game #{i+1}: {\n" +
            "\ttotal_kills: " + "#{game.game['total_kills']}" + "\n" +
            "\tplayers: " + "#{game.game['players'].sort.to_s}" + "\n" +
            "\tkills: {" + "\n" +
              "\t\t#{game.game['kills'].map{ |k,v| "#{k}: #{v}"}.sort}" + "\n" +
            "\t}\n" +
         "}"
end
