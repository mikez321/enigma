require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'date'
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

  def test_it_knows_defaults_and_inputs
    enigma1 = Enigma.new("hello world", "02715", "040895")
    assert_equal "hello world", enigma1.message
    assert_equal "02715", enigma1.key
    assert_equal "040895", enigma1.date

    enigma2 = Enigma.new("hello world", "02715")
    assert_equal "hello world", enigma2.message
    assert_equal "02715", enigma2.key
    assert_equal "default", enigma2.date

    enigma3 = Enigma.new("hello world")
    assert_equal "hello world", enigma3.message
    assert_equal "default", enigma3.key
    assert_equal "default", enigma3.date
  end

  def test_it_can_create_default_dates
    Date.stubs(:today).returns(Date.new(2020, 2, 29))
    enigma = Enigma.new("hello world", "02715")
    # Today's date is 2/29/20
    assert_equal "290220", enigma.date_verification
  end

  def test_it_can_create_deault_5_digit_keys_padded_by_0
    enigma = Enigma.new("hello world")
    enigma.stubs(:rand).returns("229")
    assert_equal "00229", enigma.key_verification
  end

  # def test_it_assigns_a_date_if_it_is_not_given_one
  #   skip
  #     Date.stubs(:today).returns(Date.new(2020, 2, 29))
  #     enigma = Enigma.new("hello world", "02715")
  #     # Today's date is 2/29/20
  #     assert_equal "290220", enigma.date
  # end

  # def test_if_no_date_is_entered_it_is_todays_date
  #   Date.stubs(:today).returns(Date.new(2020, 2, 29))
  #   enigma = Enigma.new("hello world", "02715")
  #   #Today's date is 2/29/20
  #   assert_equal "290220", enigma.date
  # end
  #
  # def test_if_no_key_is_assigned_it_is_a_random_5_digit_number
  #   #this test needs to be beefed up with a stub
  #   enigma = Enigma.new("hello world")
  #   enigma.stubs(:rand).returns("339")
  #   assert_equal String, enigma.key.class
  #   assert_equal 5, enigma.key.length
  # end

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
