class Compiler
  attr_reader :message, :alphabet
  def initialize(message)
    @message = message
    @alphabet= ("a".."z").to_a << " "
  end

  def deconstruct(word)
    word.chars.each_slice(4).map { |letter| letter.push }
  end

end
