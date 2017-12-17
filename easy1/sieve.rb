# input = number --> range [2..number]
# for n in collection 
# ==> n is prime?  true -- find multiples of prime (mark false)
#                       false -- mark as composite(not prime)
# ==> n**2  >= number  <<stop>>

class Sieve
  def initialize(number)
    @number = number
  end
  
  def primes
    numbers = (2..@number).to_a.product([true]).to_h
  
    numbers.keys.each do |key|
      if prime?(key)
        2.upto(@number / key).each do |num|
          numbers[key * num] = false
        end
      end
    end
    numbers.select { |k, v| v == true }.keys
  end
  
  private
  
  def prime?(number)
    factors = []
    1.upto(number) do |num|
      factors << num if number % num == 0
    end
    factors == [1, number]
  end
end

# LS Solution

# class Sieve
#   attr_reader :range

#   def initialize(last_num)
#     @range = (2..last_num).to_a
#   end

#   def primes
#     range.each do |prime|
#       range.reject! { |num| (num != prime) && (num % prime == 0) }
#     end
#     range
#   end  

# end