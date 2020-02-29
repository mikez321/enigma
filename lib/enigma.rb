class Enigma
  attr_reader :message, :key, :date
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @alphabet= ("a".."z").to_a
  end

  def create_keys
    {"A" => (@key[0] + @key[1]).to_i,
     "B" => (@key[1] + @key[2]).to_i,
     "C" => (@key[2] + @key[3]).to_i,
     "D" => (@key[3] + @key[4]).to_i
   }
  end

  def create_offset

  end

end
