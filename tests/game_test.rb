require 'minitest/autorun'
require_relative '../game.rb'

class GameTests < Minitest::Test
  def setup
    @new_game = Game.new
  end

  def test_types
    assert @new_game.game.is_a?(Hash)
    assert @new_game.game['total_kills'].is_a?(Integer)
    assert @new_game.game['players'].is_a?(Array)
    assert @new_game.game['kills'].is_a?(Hash)
  end

  def test_add_player
    @new_game.add_player_info('maria', 7)
    @new_game.add_player_info('chico', 3)
    @new_game.add_player_info('augusto')

    assert_equal 3, @new_game.game['players'].size
    assert_equal 3, @new_game.game['kills'].size
    assert_equal 7, @new_game.game['kills']['maria']
    assert_equal 0, @new_game.game['kills']['augusto']

    assert_equal 10, @new_game.game['total_kills']

    @new_game.add_player_info('<world>', 1)
    @new_game.add_player_info('maria', 7)
    @new_game.add_player_info('chico', 3)
    @new_game.add_player_info('augusto')

    assert_equal 3, @new_game.game['players'].size
    assert_equal 3, @new_game.game['kills'].size
    assert_equal 14, @new_game.game['kills']['maria']
    assert_equal 0, @new_game.game['kills']['augusto']

    assert_equal 21, @new_game.game['total_kills']
  end
end