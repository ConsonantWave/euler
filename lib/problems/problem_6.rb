class Problem6 < Problem
  def self.title
    "What is the difference between the sum of the squares and the square of the sums?"
  end

  def self.solve
    n = 100
    sum_of_squares, sum = 0, 0
    1.upto(n) do |i|
      sum_of_squares += i * i
      sum += i
    end
    sum * sum - sum_of_squares
  end
end
