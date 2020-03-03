require './modules/referenceable'
class Validator
  include Referenceable
  attr_reader :valid_key
  def initialize(starting_key = nil, date = nil)
    @starting_key = starting_key
    @date = date
    @valid_key = nil
  end

  def starting_key_length
    @starting_key.length
  end

  def starting_key_only_numbers?
    @starting_key.chars.map { |num| numbers.include?(num) }.all?(true)
  end

  def valid_starting_key?
    @starting_key != nil && starting_key_length == 5 && starting_key_only_numbers?
  end

  def validate_key
    if valid_starting_key?
      @valid_key = @starting_key
    else
      generated_key = rand(0..99999).to_s
      until generated_key.length == 5
        generated_key = generated_key.to_s.chars.unshift("0").join("")
      end
      @valid_key = generated_key
    end
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
