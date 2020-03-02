require './lib/scrambler'
require './lib/shifter'
require 'minitest/autorun'
require 'minitest/pride'

class ScramblerTest < Minitest::Test
  def test_it_exists
    scrambler = Scrambler.new("hello world")
    assert_instance_of Scrambler, scrambler
  end

  def test_it_has_attributes
    scrambler = Scrambler.new("hello world", "02715", "040895")
    assert_equal "hello world", scrambler.message
    assert_equal "02715", scrambler.key
    assert_equal "040895", scrambler.date
  end
end
