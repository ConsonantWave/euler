class Problem16 < Problem
  def self.title
    "What is the sum of the digits of the number 2^1000?"
  end

  BIG_NUMBER = 2 ** 1000
  
  def self.solve
     BIG_NUMBER.to_s.chars.map { |ch| ch.to_i }.reduce(:+)
  end
end
