class Problem23 < Problem
  def self.title
    "Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers."
  end

  UPPER_LIMIT = 28123

  def self.solve
    abundants = (1..UPPER_LIMIT).select { |x| x.abundant? }
    abundant_sums = {}
    (1..UPPER_LIMIT).each { |i| abundant_sums[i] = false }
    abundants.each do |a|
      abundants.take_while { |b| b <= a and (a + b) <= UPPER_LIMIT }.each do |b|
        abundant_sums[a+b] = true
      end
    end
    
    abundant_sums.delete_if{ |k,v| v }.keys.reduce(:+)
  end
end

