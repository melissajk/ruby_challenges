# raise a Runtime error if number is negative
# raise RuntimeError, 'can only take positive numbers' if number < 0
# iterate through numbers adding divisors (upto the number itself)
# classify number --> string 

class PerfectNumber
  
  def self.classify(number)
    raise RuntimeError, 'can only take positive numbers' if number < 0
  
    case aliquot_sum(number)
    when number       then 'perfect'
    when 1...number   then 'deficient'
    else                   'abundant'
    end
  end
  
  def self.aliquot_sum(number)
    total = 0
    (1...number).each do |div|
      total += div if number % div == 0
    end
    total
  end
end


