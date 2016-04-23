require_relative './parser.rb'
require_relative './game.rb'

new_parser = Parser.new File.join(File.dirname(__FILE__), 'games.log')
games = new_parser.process_file

# Pretty-printing the whole-hash (Task 2)
games.each_with_index do |game, i|
  str = ''
  game.game['kills'].sort.each { |k, v| str << "\t\t\"#{k}\": #{v}\n" }

  # rubocop:disable all
  puts  "game_#{i+1}: {\n" +
          "\ttotal_kills: " + "#{game.game['total_kills']}" + "\n" +
          "\tplayers: " + "#{game.game['players'].sort.to_s}" + "\n" +
          "\tkills: {" + "\n" +
            "#{str}" +
          "\t}\n" +
        "}"
  # rubocop:enable all
end

# Printing a general ranking (Task 2)
ranking = {}
games.each do |game|
  game.game['players'].each do |player|
    if ranking.include? player
      ranking[player] += game.game['kills'][player]
    else
      ranking[player] = game.game['kills'][player]
    end
  end
end

puts "General Ranking:", ranking.sort_by { |_k, v| -v }.to_h.map { |k, v| "#{k} => #{v}" }
