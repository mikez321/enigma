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
