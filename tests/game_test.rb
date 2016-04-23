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
    @new_game.add_kill_info('<world>', 'maria', 'MOD_TRIGGER_HURT')
    @new_game.add_kill_info('chico', 'maria', 'MOD_ROCKET_SPLASH')
    @new_game.add_kill_info('augusto', 'chico', 'MOD_ROCKET')

    assert_equal 3, @new_game.game['players'].size
    assert_equal 3, @new_game.game['kills'].size
    assert_equal -1, @new_game.game['kills']['maria']
    assert_equal 1, @new_game.game['kills']['chico']
    assert_equal 1, @new_game.game['kills']['augusto']

    assert_equal 3, @new_game.game['total_kills']

    @new_game.add_kill_info('<world>', 'chico', 'MOD_TRIGGER_HURT')
    @new_game.add_kill_info('<world>', 'chico', 'MOD_ROCKET_SPLASH')
    @new_game.add_kill_info('augusto', 'chico', 'MOD_ROCKET')

    assert_equal 3, @new_game.game['players'].size
    assert_equal 3, @new_game.game['kills'].size
    assert_equal -1, @new_game.game['kills']['chico']
    assert_equal 2, @new_game.game['kills']['augusto']

    assert_equal 6, @new_game.game['total_kills']
  end
end
