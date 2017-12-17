# input --> number

# number valid for Luhn formula?
# number = #### #### #### format
# 1111 becomes 2121
# 8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7)
# checksum = add #'s 
# checksum % 10 == 0 --> valid Luhn

# can return checksum?

# can add a digit to make the number a valid checksum? (return original # + new digit)

class Luhn
  attr_accessor :number
  
  def initialize(number)
    @number = number
  end
  
  def addends
    converted_array = []
    @number.to_s.chars.map(&:to_i).reverse_each.with_index do |num, index|
      if index.odd?
        converted_array.unshift(convert_digit(num))
      else
        converted_array.unshift(num)
      end
    end
    converted_array
  end
  
  def checksum
    addends.inject(:+)
  end
  
  def valid?
    checksum % 10 == 0
  end
  
  def self.create(number)
    new_number = Luhn.new(number * 10)
    new_number.create_valid_checksum
  end
  
  def create_valid_checksum
    return @number if valid?
    until valid?
      @number += 1
    end
    @number
  end
  
  private

  def convert_digit(number)
    double = number * 2
    double < 10 ? double : double - 9
  end
end

