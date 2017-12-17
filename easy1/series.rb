# input = a string of numbers
# all the possible consecutive number series of length (n) of that string
# object = Series.new(string arg)
# method = Series#slices(n)
# needs argument error if n > string.size

class Series
  def initialize(string)
    @numbers = string.chars.map(&:to_i)
  end
  
  def slices(n)
    raise ArgumentError, 'Slice is longer than input' unless n <= @numbers.size
    @numbers.each_cons(n).to_a
  end
end
