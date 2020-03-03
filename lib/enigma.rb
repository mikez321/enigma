require './lib/shifter'
require './lib/compiler'
require 'date'

class Enigma

  def encrypt(message, optional_key = nil, optional_date = nil)
    shifter = Shifter.new(optional_key, optional_date)
    shifter.set_key
    shifter.set_date
    compiler_shift = shifter.compiler_ready_shift
    compiler = Compiler.new(message, compiler_shift)
    cipher = compiler.scramble

    {encryption: cipher, key: shifter.key_to_use, date: shifter.date_to_use}
  end

  def decrypt(ciphertext, optional_key = nil, optional_date = nil)
    shifter = Shifter.new(optional_key, optional_date)
    shifter.set_key
    shifter.set_date

    compiler_shift = shifter.compiler_ready_shift.transform_values do
       |value| value * -1
     end

    compiler = Compiler.new(ciphertext, compiler_shift)
    message = compiler.scramble

    {decryption: message, key: shifter.key_to_use, date: shifter.date_to_use}
  end

end
