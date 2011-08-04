class Problem1 < Problem
  def self.title
    "Add all the natural numbers below one thousand that are multiples of 3 or 5."
  end

  def self.solve
    (1...1000).reduce(0) { |sum, i| (i % 3 == 0 or i % 5 == 0) ? sum + i : sum }
  end
end
