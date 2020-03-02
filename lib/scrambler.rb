require './modules/referenceable'
class Scrambler
  include Referenceable
  attr_reader :message
  def initialize(message = "None", key = nil, date = nil)
    @message = message
    @key = key
    @date = date
  end

  def date
    if @date == nil
      @date = Date.today.strftime("%d%m%y")
    end
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
    @key
  end

end
