require './lib/shifter'
require './lib/compiler'
class Enigma
  attr_reader :message, :key, :date
  def initialize( message,
                  key = rand(0..99999).to_s,
                  date = Date.today.strftime("%d%m%y"))
    @message = message
    @key = key
    @date = date
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
