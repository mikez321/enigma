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

  def test_it_has_default_values
  enigma1 = Enigma.new("Message to Encrypt")
  assert_equal "Message to Encrypt", enigma1.message
  assert_equal "default", enigma1.key
  assert_equal "000000", enigma1.date
  end

  def test_it_will_generate_a_random_five_digit_key
    enigma1 = Enigma.new("Message to Encrypt")

    assert_equal true, enigma1.key.length == 5
    assert_equal true, enigma1.key >= 0
    assert_equal true, enigma1.key <= 99999

  end

end
