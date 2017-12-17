class Trinary
  BASE          = 3
  INVALID_CHARS = /[^0-2]/
  
  def initialize(string)
    @numbers = string
  end
  
  def to_decimal
    @numbers =~ INVALID_CHARS ? 0 : calculate
  end

  def calculate
    decimal = 0
    @numbers.reverse.chars.each_with_index do |num, index|
      decimal += num.to_i * BASE**index
    end
    decimal
  end
end
