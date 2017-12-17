# method #to(limit)
# find the sum of the multiples of given numbers up to, but not including the limit
# if no given numbers, default to 3 & 5
# duplicate multiples?  Only count 1x
# loop through the multiples until limit is reached ==> result_array
# result_array.uniq.inject(:+)

class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end
  
  def to(limit)
    self.class.to(@multiples, limit)
  end
  
  def self.to(multiples=[3, 5], limit)
    result = []
    multiples.each do |multiple|
      counter = 1
      while (multiple * counter) < limit
        result << multiple * counter
        counter += 1
      end
    end
    result.empty? ? 0 : result.uniq.inject(:+)
  end
end


# LS Solution  # They all used the #select method!

# class SumOfMultiples
#   def self.to(limit, multiples = [3, 5])
#     (0...limit).select do |number|
#       multiples.any? { |multiple| number % multiple == 0 }
#     end.reduce(:+)
#   end

#   def initialize(*multiples)
#     @multiples = multiples
#   end

#   def to(limit)
#     self.class.to(limit, @multiples)
#   end
# end
