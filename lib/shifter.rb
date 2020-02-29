require './modules/letterable'
class Shifter
  include Letterable
  attr_reader :key, :date
  def initialize(key, date)
    @key = key
    @date = date
  end

  def create_keys
    keys = []
    @key.chars.each_with_index do |num, index|
      if index < (@key.chars.length) - 1
      keys << (num + @key.chars[index + 1]).to_i
      end
    end
    keys
  end

  def create_shift
    (@date.to_i ** 2).to_s.chars.map { |num| num.to_i }[-4..-1]
  end

  def total_shift
    shifts = create_keys.zip(create_shift).map do |pair|
      pair.sum
    end
    needed_letters = alphabet[0..(shifts.length-1)]
    reference_shifts = Hash[needed_letters.zip(shifts)]
  end

end
