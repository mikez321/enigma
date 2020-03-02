require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/compiler'

class CompilerTest < Minitest::Test

  def setup
    @compiler_shift = {
      "a" => 3,
      "b" => 27,
      "c" => 73,
      "d" => 20
    }
  end

  def test_it_exists
    compiler = Compiler.new("hello world", @compiler_shift)
    assert_instance_of Compiler, compiler
  end

  def test_it_has_a_message_and_a_compiler_ready_shift
    compiler = Compiler.new("hello world", @compiler_shift)
    assert_equal "hello world", compiler.message

    expected = {
      "a" => 3,
      "b" => 27,
      "c" => 73,
      "d" => 20
    }

    assert_equal expected, compiler.total_shift
  end

  def test_it_knows_the_alphabet
    compiler = Compiler.new("hello world", @compiler_shift)
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
    "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, compiler.alphabet
  end

  def test_it_knows_number_represenatations_of_letters
    compiler = Compiler.new("hello world", @compiler_shift)
    assert_equal 3, compiler.digitize("d")
    assert_equal 10, compiler.digitize("K")
    assert_equal 26, compiler.digitize(" ")
  end

  def test_it_knows_letter_representations_of_numbers
    compiler = Compiler.new("hello world", @compiler_shift)
    assert_equal "d", compiler.letterize(3)
    assert_equal "k", compiler.letterize(10)
    assert_equal " ", compiler.letterize(26)
  end

  def test_it_can_scramble_by_an_offset_amount
    compiler = Compiler.new("hello world", @compiler_shift)
    assert_equal "f", compiler.offset("d", 2)
    assert_equal "m", compiler.offset("h", 5)
    assert_equal "a", compiler.offset("z", 2)
  end

  def test_it_knows_the_number_of_shifts_needed
    example_shift_1 = {
            "a" => 2,
            "b" => 11,
          }
    compiler1 = Compiler.new("hello world", example_shift_1)
    assert_equal 2, compiler1.number_of_shifts

    example_shift_2 = {
            "a" => 2,
            "b" => 11,
            "c" => 92,
            "d" => 4,
            "e" => 50
          }
    compiler2 = Compiler.new("hello world", example_shift_2)
    assert_equal 5, compiler2.number_of_shifts
  end

  def test_it_handles_messages_in_blocks_of_four
    compiler = Compiler.new("hello world", @compiler_shift)
    expected = [['h', 'e', 'l', 'l'],['o', ' ', 'w', 'o'],['r', 'l', 'd']]
    assert_equal expected, compiler.deconstruct(compiler.message)
  end

  def test_it_scrambles_and_returns_a_string

    compiler = Compiler.new("hello world", @compiler_shift)
    assert_equal "keder ohulw", compiler.scramble
  end

  def test_it_is_not_case_sensitive

    compiler = Compiler.new("HellO WORLD", @compiler_shift)
    assert_equal "keder ohulw", compiler.scramble
  end

  def test_it_ignores_special_characters

    compiler = Compiler.new("HellO WORLD!", @compiler_shift)
    assert_equal "keder ohulw!", compiler.scramble
  end

end
