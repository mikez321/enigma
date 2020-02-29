class Compiler
  attr_reader :message, :alphabet
  def initialize(message)
    @message = message
    @alphabet= ("a".."z").to_a << " "
  end

  def digitize(word)
    word.downcase.chars.map { |letter| @alphabet.index(letter) }
  end

  def letterize(num)
    @alphabet[num]
  end

  def scramble(word, offset)
    digitize(word).map do |num|
      letterize(num + offset)
    end
  end

  def deconstruct(word)
    word.chars.each_slice(4).map { |letter| letter.push }
  end
end
