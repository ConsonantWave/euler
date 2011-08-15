class Problem48 < Problem
  def self.title
    "Find the last 10 digits of 1^1 + 2^2 + ... + 1000^1000."
  end

  LIMIT = 1000
  
  def self.solve
    (1..LIMIT).map { |n| n ** n }.reduce(:+) % 10_000_000_000
  end
end
