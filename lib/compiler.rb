class Compiler
  attr_reader :message, :alphabet
  def initialize(message)
    @message = message
    @alphabet= ("a".."z").to_a << " "
  end

  def digitize(letter)
    @alphabet.index(letter.downcase)
  end

  def letterize(num)
    @alphabet[num]
  end

  def offset(letter, offset)
      letterize((digitize(letter) + offset) % 27)
  end

  def deconstruct(word)
    word.chars.each_slice(4).map { |letter| letter.push }
  end

  # def offset(word, offset)
  #   digitize(word).map do |num|
  #     letterize(num + offset)
  #   end
  # end
end
