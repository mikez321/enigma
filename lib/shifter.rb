require './lib/validator'
require './modules/referenceable'
class Shifter
  include Referenceable
  def initialize(passed_key, passed_date)
    @passed_key = passed_key
    @passed_date = passed_date
  end

  def key
    validator = Validator.new(@passed_key, @passed_date)
    validator.validate_start_key
    validator.valid_key
  end

  def date
    validator = Validator.new(@passed_key, @passed_date)
    validator.validate_start_date
    validator.valid_date
  end

  def create_key_shift
    key.chars.each_with_index.map do |num, index|
      if index < (key.chars.length) - 1
        (num + key.chars[index + 1]).to_i
      end
    end.compact
  end

  def date_squared
    (date.to_i ** 2).to_s
  end

  def create_date_shift
    date_squared.chars.map { |num| num.to_i }[-4..-1]
  end

  def compiler_ready_shift
    summed_shifts = create_key_shift.zip(create_date_shift).map do |pair|
      pair.sum
    end
    reference_letters = alphabet[0..(summed_shifts.length-1)]
    compiler_shift = Hash[reference_letters.zip(summed_shifts)]
  end

end
