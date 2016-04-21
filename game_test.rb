require 'test/unit'
require_relative './game.rb'

class InitializerTest < Test::Unit::TestCase
  def test_types
    new_game = Game.new

    assert(new_game.is_a?(Game), 'Wrong class')

    assert(new_game.game.is_a?(Hash), 'Wrong class')
    assert(new_game.game['total_kills'].is_a?(Integer), 'Wrong class')
    assert(new_game.game['players'].is_a?(Array), 'Wrong class')
    assert(new_game.game['kills'].is_a?(Hash), 'Wrong class')
  end
end

class AddingPlayerTest < Test::Unit::TestCase
  def test_add_player
    new_game = Game.new

    new_game.add_player('maria', 7)
    new_game.add_player('chico', 3)
    new_game.add_player('augusto')

    assert_equal(3, new_game.game['players'].size, 'Unexpected number of players')
    assert_equal(3, new_game.game['kills'].size, 'Unexpected number of players')
    assert_equal(7, new_game.game['kills']['maria'], 'Unexpected kill amount')
    assert_equal(0, new_game.game['kills']['augusto'], 'Unexpected kill amount')
  end
end
