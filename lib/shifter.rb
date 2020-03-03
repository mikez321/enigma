require './lib/validator'
require './modules/referenceable'
class Shifter
  include Referenceable
  attr_reader :key_to_use, :date_to_use
  def initialize(passed_key = nil, passed_date = nil)
    @passed_key = passed_key
    @passed_date = passed_date
    @key_to_use = "TBD"
    @date_to_use = "TBD"
  end

  def set_key
    validator = Validator.new(@passed_key, @passed_date)
    validator.validate_start_key
    @key_to_use = validator.valid_key
  end

  def set_date
    validator = Validator.new(@passed_key, @passed_date)
    validator.validate_start_date
    @date_to_use = validator.valid_date
  end

  def create_key_shift
    @key_to_use.chars.each_with_index.map do |num, index|
      if index < (@key_to_use.chars.length) - 1
        (num + @key_to_use.chars[index + 1]).to_i
      end
    end.compact
  end

  def date_squared
    (@date_to_use.to_i ** 2).to_s
  end

  def create_date_shift
    date_squared.chars.map { |num| num.to_i }[-4..-1]
  end

  def compiler_ready_shift
    summed_shifts = create_key_shift.zip(create_date_shift).map do |pair|
      pair.sum
    end
    reference_letters = alphabet[0..(summed_shifts.length-1)]
    Hash[reference_letters.zip(summed_shifts)]
  end

end
