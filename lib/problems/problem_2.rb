class Problem2 < Problem
  def self.title
    "By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms."
  end

  def self.solve
    fibs = [0,1]
    until fibs[-1] > 4_000_000
      fibs << fibs[-1] + fibs[-2]
    end
    fibs[0..-1].reduce(0) { |sum, i| i % 2 == 0 ? sum + i : sum }
  end
end
