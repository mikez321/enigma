require './lib/validator'
require 'minitest/autorun'
require 'minitest/pride'

class ValidatorTest < Minitest::Test

  def test_if_an_incorrect_key_is_assigned_it_will_assign_a_random_key
    skip
    #this is an error checking test
    enigma1 = Enigma.new("ABCD")
    enigma1.stubs(:rand).returns("339")
    assert_equal "00339", enigma1.key

    enigma2 = Enigma.new("00.912")
    enigma2.stubs(:rand).returns("339")
    assert_equal "00339", enigma2.key

    enigma3 = Enigma.new("12")
    enigma3.stubs(:rand).returns("339")
    assert_equal "00339", enigma3.key
  end
  
  def test_if_an_incorrect_date_is_assigned_it_will_assign_a_random_date
    skip
    #this is an error checking method
    Date.stubs(:today).returns(Date.new(2020, 2, 29))

    enigma1 = Enigma.new("02715", "895")
    assert_equal "290220", enigma1.date

    enigma2 = Enigma.new("02715")
    assert_equal "290220", enigma2.date

    enigma3 = Enigma.new("02715")
    assert_equal "290220", enigma3.date
  end
end
