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
end
