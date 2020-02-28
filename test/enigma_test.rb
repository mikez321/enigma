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

  
end
