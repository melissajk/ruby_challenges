# convert an octal string to a decimal
# the last digit of an octal can be 1 - 7, but not 8 or 9
# alpha or alphanumeric strings are not accepted
# the octal string can lead with a 0 (e.g. 011)
# to get a decimal number of an octal, you multiply n * (following)
# oct**0 ==> 1
# oct**1 ==> 8
# oct**2 ==> 64
# oct**3 ==> 512

# convert string to array of chars
# pop of char -- mult by oct**0 ==> total


class Octal
  BASE = 8

  def initialize(string)
    @numbers = invalid_octal?(string) ? "invalid octal" : string.chars
  end
  
  def invalid_octal?(string)
    string.match(/\D|[8-9]/)
  end
  
  def to_decimal
    return 0 if @numbers == "invalid octal"
    decimal = 0
    numbers = @numbers.reverse
    (0...numbers.size).each do |index|
      decimal += (numbers[index].to_i) * BASE**index
    end
    decimal
  end
end

# LS Solution

# class Octal
#   BASE = 8
#   INVALID_OCTAL = /\D|[8-9]/

#   attr_reader :octal_string

#   def initialize(octal_string)
#     @octal_string = octal_string
#   end

#   def to_decimal
#     octal_string =~ INVALID_OCTAL ? 0 : calculate
#   end

#   private

#   def calculate
#     decimal = 0
#     octal_string.reverse.each_char.with_index do |char, index|
#       decimal += char.to_i * (BASE ** index)
#     end
#     decimal
#   end

# end
