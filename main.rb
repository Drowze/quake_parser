require 'pp'
require_relative './parser.rb'
require_relative './game.rb'

new_parser = Parser.new File.join(File.dirname(__FILE__), 'games.log')
games = new_parser.process_file

# Pretty-printing the whole-hash (Task 2)
games.each_with_index do |game, i|
  playerlist = ''
  game.data['kills'].sort.each { |k, v| playerlist << "\t\t\"#{k}\": #{v}\n" }

  # Organizing and preparing the meanslist to be printed
  meanslist = ''
  game.data['kill_by_means'].sort_by { |_k, v| -v }.to_h.each { |k, v| meanslist << "\t\t\"#{k}\": #{v}\n" }

  # rubocop:disable all
  puts  "game_#{i+1}: {\n" +
          "\ttotal_kills: " + "#{game.data['total_kills']}" + "\n" +
          "\tplayers: " + "#{game.data['players'].sort.to_s}" + "\n" +
          "\tkills: {" + "\n" +
            "#{playerlist}" +
          "\t}\n" +
          "\tkills_by_means: {\n" +
          "#{meanslist}\n" +
          "\t}\n" +
        "}"
  # rubocop:enable all
end

# Printing a general ranking (Task 2)
ranking = {}
games.each do |game|
  game.data['players'].each do |player|
    if ranking.include? player
      ranking[player] += game.data['kills'][player]
    else
      ranking[player] = game.data['kills'][player]
    end
  end
end

puts 'General Ranking:', ranking.sort_by { |_k, v| -v }.to_h.map { |k, v| "#{k}: #{v}" }
