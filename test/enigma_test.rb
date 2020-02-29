require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new("message", "key", "date")
    assert_instance_of Enigma, enigma
  end

  def test_it_has_information
    enigma = Enigma.new("message", "key", "date")
    assert_equal "message", enigma.message
    assert_equal "key", enigma.key
    assert_equal "date", enigma.date
  end

  def test_it_can_create_the_key
    enigma = Enigma.new("message", "02715", "date")
    assert_equal "02715", enigma.key
    expected = {
      "A" => 02,
      "B" => 27,
      "C" => 71,
      "D" => 15
    }

    assert_equal expected, enigma.create_keys
  end

  def test_it_can_create_offsets_from_the_date
    enigma = Enigma.new("message", "02715", "040895")

    expected = {
      "A" => 1,
      "B" => 0,
      "C" => 2,
      "D" => 5
    }

    assert_equal expected, enigma.create_offset
  end
end
