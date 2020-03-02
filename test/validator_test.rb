require './lib/validator'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class ValidatorTest < Minitest::Test

  def test_it_exists
    validator = Validator.new("02715", "030220")
    assert_instance_of Validator, validator
  end

  def test_if_no_key_is_assigned_it_is_a_random_5_digit_number
    validator = Validator.new
    validator.stubs(:rand).returns("339")
    assert_equal "00339", validator.key
  end

  def test_if_an_incorrect_key_is_assigned_it_will_assign_a_random_key
    validator1 = Validator.new("ABCD")
    validator1.stubs(:rand).returns("339")
    assert_equal "00339", validator1.key

    validator2 = Validator.new("00.912")
    validator2.stubs(:rand).returns("339")
    assert_equal "00339", validator2.key

    validator3 = Validator.new("12")
    validator3.stubs(:rand).returns("339")
    assert_equal "00339", validator3.key
  end

  def test_it_assigns_todays_date_if_it_is_not_given_one
    Date.stubs(:today).returns(Date.new(2020, 2, 29))
    #For the purpose of this test, today's date is Feb 29, 2020
      validator = Validator.new
      assert_equal "290220", validator.date
  end

  def test_if_an_incorrect_date_is_assigned_it_will_assign_a_random_date
    Date.stubs(:today).returns(Date.new(2020, 2, 29))

    validator1 = Validator.new("02715", "895")
    assert_equal "290220", validator1.date

    validator2 = Validator.new("02715", "8.11")
    assert_equal "290220", validator2.date

    validator3 = Validator.new("02715", "Josh")
    assert_equal "290220", validator3.date
  end
end
