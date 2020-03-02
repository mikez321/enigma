require './lib/scrambler'
require './lib/shifter'
require 'minitest/autorun'
require 'minitest/pride'

class ScramblerTest < Minitest::Test
  def test_it_exists
    scrambler = Scrambler.new("hello world")
    assert_instance_of Scrambler, scrambler
  end

  def test_it_has_a_message
    scrambler = Scrambler.new("hello world")
    assert_equal "hello world", scrambler.message
  end
end
