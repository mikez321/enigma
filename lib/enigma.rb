require './lib/shifter'
require './lib/compiler'
require 'date'

class Enigma

  def encrypt(message, optional_key = key, optional_date = date)
    shifter = Shifter.new(optional_key, optional_date)
    compiler_shift = shifter.compiler_ready_shift
    compiler = Compiler.new(message, compiler_shift)
    cipher = compiler.scramble

    output = {
      encryption: cipher,
      key: optional_key,
      date: optional_date
    }
  end

  def decrypt(ciphertext, optional_key = key, optional_date = date)
    shifter = Shifter.new(optional_key, optional_date)
    
    compiler_shift = shifter.compiler_ready_shift.transform_values do
       |value| value * -1
     end

    compiler = Compiler.new(ciphertext, compiler_shift)
    message = compiler.scramble

    output = {
      decryption: message,
      key: optional_key,
      date: optional_date
    }
  end

end
