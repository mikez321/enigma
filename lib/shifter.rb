class Shifter
  attr_reader :key, :date
  def initialize(key, date)
    @key = key
    @date = date
  end

  def create_keys
    keys_from_input = @key.chars
    keys = []
    keys_from_input.each_with_index do |num, index|
      if index < (keys_from_input.length) - 1
      keys << (num + keys_from_input[index + 1]).to_i
      end
    end
    keys
  end

  def create_shift
    (@date.to_i ** 2).to_s.chars.map { |num| num.to_i }[-4..-1]
  end

  def total_shift
    create_keys.zip(create_shift).flat_map do |pair|
      pair.sum
    end
  end

end
