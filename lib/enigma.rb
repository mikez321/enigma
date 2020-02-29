class Enigma
  attr_reader :message, :key , :date
  def initialize(message, key = "default", date = "000000")
    @message = message
    @key = key
    @date = date
  end

end
