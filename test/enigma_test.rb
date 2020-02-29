require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new("hello world", "02715", "040895")
    assert_instance_of Enigma, enigma
  end

  def test_it_has_attributes
    enigma = Enigma.new("hello world", "02715", "040895")
    assert_equal "hello world", enigma.message
    assert_equal "02715", enigma.key
    assert_equal "040895", enigma.date
  end

  def test_if_no_date_is_entered_it_is_todays_date
    enigma = Enigma.new("hello world", "02715")
    #Today's date is 2/29/20
    Date.stubs(:today).returns(Date.new(2020, 02, 29))
    assert_equal "290220", enigma.date
  end

  def test_if_no_key_is_assigned_it_is_a_random_5_digit_number
    #this test needs to be beefed up with a stub
    enigma = Enigma.new("hello world")
    assert_equal String, enigma.key.class
    assert_equal 5, enigma.key.length
  end

  def test_it_can_encrypt_messages
    enigma = Enigma.new("hello world", "02715", "040895")
      expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
  assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_messages
    enigma = Enigma.new("hello world", "02715", "040895")
    expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end
end
