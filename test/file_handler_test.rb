require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/file_handler'

class EnigmaTest < Minitest::Test

  def test_it_exists
    file_handler = FileHandler.new("file")
    assert_instance_of FileHandler, file_handler
  end

  def test_it_has_a_file_but_no_message
    file = mock("file location")
    file_handler = FileHandler.new(file)
    assert_equal file, file_handler.file
    assert_nil file_handler.message
  end

  def test_it_can_read_a_message_and_store_it
    file = "./fake_message.txt"
    file_handler = FileHandler.new(file)
    file_handler.create_message


    expected = "hello world"
    assert_equal expected, file_handler.message
  end


end
