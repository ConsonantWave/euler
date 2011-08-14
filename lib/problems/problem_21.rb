class Problem21 < Problem
  def self.title
    "Evaluate the sum of all amicable pairs under 10000."
  end

  LIMIT = 10000
  
  def self.solve
    amicable_sum = 0
    divisor_sums = { 1 => 0 }
    (2..LIMIT).each do |test|
      unless divisor_sums.has_key? test
        curr_sum = test.sum_of_proper_divisors
        divisor_sums[test] = curr_sum
        if curr_sum != test
          if divisor_sums.has_key? curr_sum
            rec_sum = divisor_sums[curr_sum]
          else
            rec_sum = curr_sum.sum_of_proper_divisors
            divisor_sums[curr_sum] = rec_sum
          end
          if rec_sum == test
            amicable_sum += test
            amicable_sum += curr_sum
          end
        end
      end
    end
    return amicable_sum
  end
end
