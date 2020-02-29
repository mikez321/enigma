require './lib/shifter'
class Enigma


  def encrypt(message, key, date)
    shifter = Shifter.new(key, date)
    keys = shifter.create_keys
    shift = shifter.create_shift
    compiler = Compiler.new()
  end


end
