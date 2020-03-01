require './modules/referenceable'
class Compiler
  include Referenceable

  attr_reader :message, :total_shift
  def initialize(message, total_shift)
    @message = message
    @total_shift = total_shift
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

  def deconstruct(message)
    num_of_compilers = total_shift.keys.length
    message.chars.each_slice(num_of_compilers).map { |letter| letter.push }
  end

  def scramble
    deconstruct(message).map do |group|
      group.each_with_index.map do |letter, index|
        if !alphabet.include?(letter.downcase)
          letter
        elsif index == 0
          offset(letter, @total_shift["a"])
        elsif
          index == 1
          offset(letter, @total_shift["b"])
        elsif
          index == 2
          offset(letter, @total_shift["c"])
        elsif
          index == 3
          offset(letter, @total_shift["d"])
        end
      end
    end.flatten.join("")
  end

end
