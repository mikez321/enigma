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

  def test_it_can_encrypt_messages
    enigma = Enigma.new
      expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_messages
    enigma = Enigma.new
    expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end
end
