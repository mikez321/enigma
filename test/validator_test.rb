require './lib/validator'
require 'date'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class ValidatorTest < Minitest::Test

  def test_it_exists
    validator = Validator.new("02715", "030220")
    assert_instance_of Validator, validator
  end

  def test_it_can_return_a_valid_key
    validator = Validator.new("02715", "030220")
    validator.validate_start_key
    assert_equal "02715", validator.valid_key
  end

  def test_it_knows_how_long_keys_are
    validator1 = Validator.new("02715", "030220")
    assert_equal 5, validator1.start_key_length

    validator2 = Validator.new("0099912")
    assert_equal 7, validator2.start_key_length
  end

  def test_it_knows_if_a_key_is_only_numeric
    validator1 = Validator.new("02715")
    assert_equal true, validator1.start_key_only_numbers?
    validator2 = Validator.new("ABCD")
    assert_equal false, validator2.start_key_only_numbers?
    validator3 = Validator.new("AB.89!")
    assert_equal false, validator3.start_key_only_numbers?

  end

  def test_it_can_test_for_a_valid_key
    validator1 = Validator.new("02715", "030220")
    assert_equal true, validator1.valid_start_key?

    validator2 = Validator.new("00.912")
    assert_equal false, validator2.valid_start_key?

    validator3 = Validator.new("Nick")
    assert_equal false, validator3.valid_start_key?

    validator4 = Validator.new("1")
    assert_equal false, validator4.valid_start_key?
  end

  def test_if_an_incorrect_key_is_assigned_it_will_assign_a_random_key
    validator1 = Validator.new("ABCD")
    validator1.stubs(:rand).returns("3907")
    validator1.validate_start_key
    assert_equal "03907", validator1.valid_key

    validator2 = Validator.new("83620")
    validator2.validate_start_key
    assert_equal "83620", validator2.valid_key
  end

  def test_random_keys_will_be_padded_by_0_if_not_5_numbers
    validator = Validator.new("14", "030220")
    validator.stubs(:rand).returns("339")
    validator.validate_start_key
    assert_equal "00339", validator.valid_key
  end

  def test_it_can_return_a_valid_date
    validator = Validator.new("02715", "030220")
    validator.validate_start_date
    assert_equal ("030220"), validator.valid_date
  end

  def test_it_knows_the_length_of_entered_dates
    validator = Validator.new("02715", "030220")
    assert_equal 6, validator.start_date_length
  end

  def test_dates_must_be_only_numbers
    validator1 = Validator.new("02715", "030220")
    assert_equal true, validator1.start_date_only_numbers?

    validator2 = Validator.new("02715", "JJ67LE")
    assert_equal false, validator2.start_date_only_numbers?
  end

  def test_it_can_break_apart_valid_dates
    validator = Validator.new("02715", "030220")
    expected = {
      "month" => "03",
      "day" => "02",
      "year" => "20"
    }
    assert_equal expected, validator.start_date_parts
  end

  def test_it_can_validate_a_real_date_with_its_parts
    validator1 = Validator.new("02715", "030220")
    validator1.start_date_parts
    assert_equal true, validator1.start_date_real?

    validator2 = Validator.new("02715", "829990")
    validator2.start_date_parts
    assert_equal false, validator2.start_date_real?
  end

  def test_it_assigns_todays_date_if_it_is_not_given_one
    Date.stubs(:today).returns(Date.new(2020, 2, 29))
    #For the purpose of this test, today's date is Feb 29, 2020
      validator = Validator.new
      validator.validate_start_date
      assert_equal "290220", validator.valid_date
  end

  def test_if_an_incorrect_date_is_assigned_it_will_assign_a_random_date
    Date.stubs(:today).returns(Date.new(2020, 2, 29))

    validator1 = Validator.new("02715", "895")
    validator1.validate_start_date
    assert_equal "290220", validator1.valid_date

    validator2 = Validator.new("02715", "8.11")
    validator2.validate_start_date
    assert_equal "290220", validator2.valid_date

    validator3 = Validator.new("02715", "Josh")
    validator3.validate_start_date
    assert_equal "290220", validator3.valid_date
  end
end
