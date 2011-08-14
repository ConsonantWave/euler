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
  
  def digits_unique?
    digit_array = self.to_s.each_char.to_a
    digit_array == digit_array.uniq
  end
end

class String
  def pandigital?
    self.each_char.to_a.sort.reduce(:+) == "123456789"
  end
end
