require './lib/shifter'
require './lib/compiler'
class Enigma


  def encrypt(message, key, date)
    shifter = Shifter.new(key, date)
    compiler_shift = shifter.compiler_ready_shift
    compiler = Compiler.new(message, compiler_shift)
    message = compiler.scramble

    output = {
      encryption: message,
      key: key,
      date: date
    }
  end


end
