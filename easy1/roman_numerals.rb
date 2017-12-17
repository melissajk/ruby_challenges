
# 149 % 10 = 9  
# 140 % 100 = 40
# 100 % 1000 = 100

class Fixnum  
  NUMERALS = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C',
               90 => 'XC', 50 =>'L', 40 => 'XL', 10 => 'X', 9 => "IX", 5 => 'V',
               4 => 'IV', 1 => 'I' }
  def to_roman
    roman_numeral = ''
    number = self
    NUMERALS.keys.each do |key|
      if number >= key
        loop do
          number -= key
          roman_numeral << NUMERALS[key]
          break if number < key
        end
      else
        key
      end
    end
    roman_numeral
  end
end