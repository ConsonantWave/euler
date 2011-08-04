class Problem4 < Problem
  def self.title
    "Find the largest palindrome made from the product of two 3-digit numbers."
  end

  def self.solve
    1998.downto(100) do |sum|
      (sum.div 2).upto(999) do |i|
        j = sum - i
        return i * j if (i * j).palindrome?
      end
    end
  end
end
