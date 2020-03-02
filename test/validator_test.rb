require './lib/validator'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class ValidatorTest < Minitest::Test

  def test_it_exists
    validator = Validator.new("02715", "030220")
    assert_instance_of Validator, validator
  end

  def test_it_knows_how_long_keys_are
    validator1 = Validator.new("02715", "030220")
    assert_equal 5, validator1.key_length

    validator2 = Validator.new("0099912")
    assert_equal 7, validator2.key_length
  end

  def test_it_knows_if_a_key_is_only_numeric
    validator1 = Validator.new("02715")
    assert_equal true, validator1.key_only_numbers?
    validator2 = Validator.new("ABCD")
    assert_equal false, validator2.key_only_numbers?
    validator3 = Validator.new("AB.89!")
    assert_equal false, validator3.key_only_numbers?

  end

  def test_it_can_test_for_a_valid_key
    validator1 = Validator.new("02715", "030220")
    assert_equal true, validator1.valid_key?

    validator2 = Validator.new("00.912")
    assert_equal false, validator2.valid_key?

    validator3 = Validator.new("Nick")
    assert_equal false, validator3.valid_key?

    validator4 = Validator.new("1")
    assert_equal false, validator4.valid_key?
  end

  def test_if_no_key_is_assigned_it_is_a_random_5_digit_number
    skip
    validator = Validator.new
    validator.stubs(:rand).returns("339")
    assert_equal "00339", validator.key
  end

  def test_if_an_incorrect_key_is_assigned_it_will_assign_a_random_key
    skip
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
    skip
    Date.stubs(:today).returns(Date.new(2020, 2, 29))
    #For the purpose of this test, today's date is Feb 29, 2020
      validator = Validator.new
      assert_equal "290220", validator.date
  end

  def test_if_an_incorrect_date_is_assigned_it_will_assign_a_random_date
    skip
    Date.stubs(:today).returns(Date.new(2020, 2, 29))

    validator1 = Validator.new("02715", "895")
    assert_equal "290220", validator1.date

    validator2 = Validator.new("02715", "8.11")
    assert_equal "290220", validator2.date

    validator3 = Validator.new("02715", "Josh")
    assert_equal "290220", validator3.date
  end
end
