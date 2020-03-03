require './modules/referenceable'
require 'date'
class Validator
  include Referenceable
  attr_reader :valid_key, :valid_date
  def initialize(start_key = nil, start_date = nil)
    @start_key = start_key
    @start_date = start_date
    @valid_key = nil
    @valid_date = nil
  end

  def start_key_length
    @start_key.length
  end

  def start_key_only_numbers?
    @start_key.chars.map { |num| numbers.include?(num) }.all?(true)
  end

  def valid_start_key?
    @start_key != nil && start_key_length == 5 && start_key_only_numbers?
  end

  def validate_start_key
    if valid_start_key?
      @valid_key = @start_key
    else
      generated_key = rand(0..99999).to_s
      until generated_key.length == 5
        generated_key = generated_key.to_s.chars.unshift("0").join("")
      end
      @valid_key = generated_key
    end
  end

  def start_date_length
    @start_date.length
  end

  def start_date_only_numbers?
    @start_date.chars.map { |num| numbers.include?(num) }.all?(true)
  end

  def start_date_parts
    date_pairs = @start_date.chars.each_slice(2).map { |num| num }
    dmy = {}
      dmy["month"] = date_pairs[0].join("")
      dmy["day"] = date_pairs[1].join("")
      dmy["year"] = date_pairs[2].join("")
      dmy
  end

  def start_date_real?
    d = start_date_parts["day"].to_i
    m = start_date_parts["month"].to_i
    y = ("20" + start_date_parts["year"]).to_i
    Date.valid_date?(y, m, d)
  end

  def valid_start_date?
    @start_date != nil && start_date_length == 6 && start_date_only_numbers? && start_date_real?
  end

  def validate_start_date
    if valid_start_date?
      @valid_date = @start_date
    else
      @valid_date = Date.today.strftime("%d%m%y")
    end
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
