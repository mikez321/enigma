require './lib/shifter'
require './lib/compiler'
require 'date'
class Enigma
  attr_reader :message, :key, :date
  def initialize( message, key = "default", date = "default")
    @message = message
    @key = key
    @date = date
  end

  def date_verification
    if @date == "default"
      @date = Date.today.strftime("%d%m%y")
    end
  end

  def key_verification
    if @key == "default"
    default_key = rand(0..999).to_s
      until default_key.length == 5
        default_key = default_key.to_s.chars.unshift("0").join("")
      end
    end
    default_key
  end

  def encrypt(message, key, date)
    shifter = Shifter.new(key, date)
    compiler_shift = shifter.compiler_ready_shift
    compiler = Compiler.new(message, compiler_shift)
    cipher = compiler.scramble

    output = {
      encryption: cipher,
      key: key,
      date: date
    }
  end

  def decrypt(ciphertext, key, date)
    shifter = Shifter.new(key, date)

    ## here's the difference
    compiler_shift = shifter.compiler_ready_shift.transform_values do
       |value| value * -1
     end

    compiler = Compiler.new(ciphertext, compiler_shift)
    message = compiler.scramble

    output = {
      decryption: message,
      key: key,
      date: date
    }
  end

end
