require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_handler'

class EnigmaTest < Minitest::Test

  def setup
    @file_handler = FileHandler.new("file")
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  endF

  def test_it_has_a_file
    assert_equal "file", @file_handler.file
  end
end
