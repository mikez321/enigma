require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new("message", "key", "date")
  end
  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_information
    assert_equal "message", @enigma.message
    assert_equal "key", @enigma.key
    assert_equal "date", @enigma.date
  end

  def test_it_has_default_values
  enigma1 = Enigma.new("Message to Encrypt")
  assert_equal "Message to Encrypt", enigma1.message
  assert_equal "default", enigma1.key
  assert_equal "000000", enigma1.date
  end

end
