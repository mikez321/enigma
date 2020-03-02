require './modules/referenceable'
class Validator
  include Referenceable
  def initialize(key = nil, date = nil)
    @key = key
    @date = date
  end

  def key
    if @key == nil || @key.chars.map { |num| numbers.include?(num) }.all?(false) || @key.length != 5
    default_key = rand(0..99999).to_s
      until default_key.length == 5
        default_key = default_key.to_s.chars.unshift("0").join("")
      end
      default_key
      @key = default_key
    end
    @given_key_used = false
    @key
  end

  def date
    if @date == nil || @date.chars.map { |num| numbers.include?(num) }.all?(false) || @date.length !=6
      @date = Date.today.strftime("%d%m%y")
    end
    @given_date_used = false
    @date
  end

  # def error_message
  #   if @given_key_used == false
  #     puts "WARNING: The given key was invalid or missing."
  #   end
  #
  #   if @given_date_used == false
  #     puts "WARNING: The given date was invalid or missing."
  #   end
  # end

end
