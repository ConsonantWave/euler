class Problem40 < Problem
  def self.title
    "Finding the nth digit of the fractional part of the irrational number."
  end

  def self.solve
    irr_str = (0..1_000_000).reduce("") { |acc, n| acc << n.to_s }
    indices = [1, 10, 100, 1000, 10_000, 100_000, 1_000_000]
    indices.reduce(1) { |acc, n| acc *= irr_str[n].to_i }
  end
end
