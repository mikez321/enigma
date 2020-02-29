require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shifter'

class ShifterTest < Minitest::Test

  def setup
    @shifter = Shifter.new("02715", "040895")
  end

  def test_it_exists
    assert_instance_of Shifter, @shifter
  end

  def test_it_has_a_key_and_a_date
    assert_equal "02715", @shifter.key
    assert_equal "040895", @shifter.date
  end

  def test_it_can_create_keys
    assert_equal ["02", "27", "71", "15"], @shifter.create_keys
  end

  def test_it_creates_a_shift_from_the_date
    assert_equal ["1", "0", "2", "5"], @shifter.create_shift
  end
end
