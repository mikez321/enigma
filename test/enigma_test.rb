require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'date'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  # def test_it_has_attributes
  #   enigma = Enigma.new
  #   assert_equal "hello world", enigma.message
  #   assert_equal "02715", enigma.key
  #   assert_equal "040895", enigma.date
  # end

  def test_it_assigns_todays_date_if_it_is_not_given_one
    skip
    Date.stubs(:today).returns(Date.new(2020, 2, 29))
    #For the purpose of this test, today's date is Feb 29, 2020
      enigma = Enigma.new("hello world", "02715")
      assert_equal "290220", enigma.date
  end

  def test_if_no_key_is_assigned_it_is_a_random_5_digit_number
    skip
    enigma = Enigma.new("hello world")
    enigma.stubs(:rand).returns("339")
    assert_equal "00339", enigma.key
  end

  def test_if_an_incorrect_key_is_assigned_it_will_assign_a_random_key
    skip
    enigma1 = Enigma.new("hello world", "ABCD")
    enigma1.stubs(:rand).returns("339")
    assert_equal "00339", enigma1.key

    enigma2 = Enigma.new("hello world", "00.912")
    enigma2.stubs(:rand).returns("339")
    assert_equal "00339", enigma2.key

    enigma3 = Enigma.new("hello world", "12")
    enigma3.stubs(:rand).returns("339")
    assert_equal "00339", enigma3.key
  end

  def test_it_can_encrypt_messages
    skip
    enigma = Enigma.new("hello world", "02715", "040895")
      expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
  assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_messages
    skip
    enigma = Enigma.new("hello world", "02715", "040895")
    expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end
end
