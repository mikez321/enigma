require './modules/letterable'
class Compiler
  include Letterable
  attr_reader :message
  def initialize(message, shift)
    @message = message
    @shift = shift
  end

  def digitize(letter)
    alphabet.index(letter.downcase)
  end

  def letterize(num)
    alphabet[num]
  end

  def offset(letter, offset)
      letterize((digitize(letter) + offset) % 27)
  end

  def deconstruct(word)
    word.chars.each_slice(4).map { |letter| letter.push }
  end

  def scramble(word, ref_shifts)
    deconstruct(word).map do |group|
      group.each_with_index.map do |letter, index|
        if index == 0
          offset(letter, ref_shifts["a"])
        elsif
          index == 1
          offset(letter, ref_shifts["b"])
        elsif
          index == 2
          offset(letter, ref_shifts["c"])
        elsif
          index == 3
          offset(letter, ref_shifts["d"])
        end
      end
    end.flatten.join("")
  end

end
