class Integer
  def palindrome?
    self.to_s == self.to_s.reverse
  end

  def abundant?
    self < sum_of_proper_divisors
  end
  
  def sum_of_proper_divisors
    sum = 1
    2.upto(Math.sqrt(self).floor) do |i|
      if self % i == 0
        sum += i
        if self / i != i
          sum += self / i
        end
      end
    end
    return sum
  end
end
