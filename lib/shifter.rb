require './modules/referenceable'
class Shifter
  include Referenceable
  attr_reader :key, :date
  def initialize(key, date)
    @key = key
    @date = date
  end

  def create_key_shift
    key_shift = []
    @key.chars.each_with_index do |num, index|
      if index < (@key.chars.length) - 1
      key_shift << (num + @key.chars[index + 1]).to_i
      end
    end
    key_shift
  end

  def create_date_shift
    date_squared = (@date.to_i ** 2).to_s
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
