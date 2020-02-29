require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/compiler'
require './lib/shifter'

class CompilerTest < Minitest::Test

  def setup
    @compiler = Compiler.new("hello world")
    @shifter = Shifter.new("02715", "040895")
  end

  def test_it_exists
    assert_instance_of Compiler, @compiler
  end

  def test_it_has_a_message
    assert_equal "hello world", @compiler.message
  end

  def test_it_knows_the_alphabet
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
    "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, @compiler.alphabet
  end

  def test_it_handles_messages_in_blocks_of_four
    expected = [['h', 'e', 'l', 'l'],['o', ' ', 'w', 'o'],['r', 'l', 'd']]
    assert_equal expected, @compiler.deconstruct(@compiler.message)
  end
end
