require 'minitest/autorun'
require_relative '../parser.rb'

class ParserTests < Minitest::Test
  def setup 
    @parser = Parser.new '../games.log'
  end

  def test_types
    assert(@parser.games.is_a?(Array), 'Wrong class')
  end

  def test_kill_parser
    str1 = "25:18 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT"
    str2 = "4:37 Kill: 3 5 3: Isgalamido killed Assasinu Credi by MOD_MACHINEGUN"
    str3 = "5:52 Kill: 5 2 7: Assasinu Credi killed Dono da Bola by MOD_ROCKET_SPLASH"
    
    result1 = @parser.parse_kill_str str1
    result2 = @parser.parse_kill_str str2
    result3 = @parser.parse_kill_str str3

    assert_equal '<world>', result1[0]
    assert_equal 'Isgalamido', result1[1]
    assert_equal 'MOD_TRIGGER_HURT', result1[2]

    assert_equal 'Isgalamido', result2[0]
    assert_equal 'Assasinu Credi', result2[1]
    assert_equal 'MOD_MACHINEGUN', result2[2]

    assert_equal 'Assasinu Credi', result3[0]
    assert_equal 'Dono da Bola', result3[1]
    assert_equal 'MOD_ROCKET_SPLASH', result3[2]
  end
end

