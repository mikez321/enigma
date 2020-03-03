require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shifter'

class ShifterTest < Minitest::Test

  def setup
    @shifter = Shifter.new("02715", "040895")
    @shifter.set_key
    @shifter.set_date
  end

  def test_it_exists
    assert_instance_of Shifter, @shifter
  end

  def test_it_has_a_key_and_a_date
    assert_equal "02715", @shifter.set_key
    assert_equal "040895", @shifter.set_date
  end

  def test_it_can_create_key_shift
    assert_equal [2, 27, 71, 15], @shifter.create_key_shift
  end

  def test_it_can_square_dates
    assert_equal "1672401025", @shifter.date_squared
  end

  def test_it_creates_a_shift_from_the_date
    assert_equal [1, 0, 2, 5], @shifter.create_date_shift
  end

  def test_it_can_create_the_final_shifts
    expected = {
      "a" => 3,
      "b" => 27,
      "c" => 73,
      "d" => 20
    }
    assert_equal expected, @shifter.compiler_ready_shift
  end

end
