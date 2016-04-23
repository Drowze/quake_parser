require 'minitest/autorun'
require_relative '../game.rb'

class GameTests < Minitest::Test
  def setup
    @new_game = Game.new
  end

  def test_types
    assert @new_game.data.is_a?(Hash)
    assert @new_game.data['total_kills'].is_a?(Integer)
    assert @new_game.data['players'].is_a?(Array)
    assert @new_game.data['kills'].is_a?(Hash)
  end

  def test_add_player
    @new_game.add_kill_info('<world>', 'maria', 'MOD_TRIGGER_HURT')
    @new_game.add_kill_info('chico', 'maria', 'MOD_ROCKET_SPLASH')
    @new_game.add_kill_info('augusto', 'chico', 'MOD_ROCKET')

    assert_equal 3, @new_game.data['players'].size
    assert_equal 3, @new_game.data['kills'].size
    assert_equal (-1), @new_game.data['kills']['maria']
    assert_equal 1, @new_game.data['kills']['chico']
    assert_equal 1, @new_game.data['kills']['augusto']

    assert_equal 3, @new_game.data['total_kills']

    @new_game.add_kill_info('<world>', 'chico', 'MOD_TRIGGER_HURT')
    @new_game.add_kill_info('<world>', 'chico', 'MOD_ROCKET_SPLASH')
    @new_game.add_kill_info('augusto', 'chico', 'MOD_ROCKET')

    assert_equal 3, @new_game.data['players'].size
    assert_equal 3, @new_game.data['kills'].size
    assert_equal (-1), @new_game.data['kills']['chico']
    assert_equal 2, @new_game.data['kills']['augusto']

    assert_equal 6, @new_game.data['total_kills']
  end

  def test_kill_method
    sum = 0
    @new_game.add_kill_info('<world>', 'maria', 'MOD_TRIGGER_HURT')
    @new_game.add_kill_info('chico', 'maria', 'MOD_ROCKET_SPLASH')
    @new_game.add_kill_info('augusto', 'chico', 'MOD_ROCKET')

    # Get a sum of all the kill methods
    @new_game.data['kill_by_means'].each { |_k, v| sum += v}

    # Compare the previous sum to total-kills
    assert_equal @new_game.data['total_kills'], sum
  end
end
