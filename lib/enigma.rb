require './lib/shifter'
require './lib/compiler'
require 'date'
require './modules/referenceable'
class Enigma
  include Referenceable
  def initialize(key = nil, date = nil)
    @key = key
    @date = date
    @given_key_used = true
    @given_date_used = true
  end

  def date
    if @date == nil || @date.chars.map { |num| numbers.include?(num) }.all?(false) || @date.length !=6
      @date = Date.today.strftime("%d%m%y")
    end
    @given_date_used = false
    @date
  end

  def key
    if @key == nil || @key.chars.map { |num| numbers.include?(num) }.all?(false) || @key.length != 5
    default_key = rand(0..99999).to_s
      until default_key.length == 5
        default_key = default_key.to_s.chars.unshift("0").join("")
      end
      @key = default_key
    end
    @given_key_used = false
    @key
  end

  def encrypt(message, optional_key = key, optional_date = date)
    shifter = Shifter.new(optional_key, optional_date)
    compiler_shift = shifter.compiler_ready_shift
    compiler = Compiler.new(message, compiler_shift)
    cipher = compiler.scramble

    if @given_key_used == false
      puts "WARNING: The given key was invalid or missing."
    end

    if @given_date_used == false
      puts "WARNING: The given date was invalid or missing."
    end

    output = {
      encryption: cipher,
      key: optional_key,
      date: optional_date
    }
  end

  def decrypt(ciphertext, optional_key = key, optional_date = date)
    shifter = Shifter.new(optional_key, optional_date)

    ## here's the difference
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
