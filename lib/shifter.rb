class Shifter
  attr_reader :key, :date
  def initialize(key, date)
    @key = key
    @date = date
  end

  def create_keys
    keys_from_input = @key.split("")
    keys = []
    keys_from_input.each_with_index do |num, index|
      if index < (keys_from_input.length) - 1
      keys << (num + keys_from_input[index + 1]).to_i
      end
    end
    keys
  end

end
