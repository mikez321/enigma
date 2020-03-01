module Referenceable

  def alphabet
    ("a".."z").to_a << " "
  end

  def numbers
    (0..9).to_a.map { |num| num.to_s }
  end


end
