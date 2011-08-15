class Problem34 < Problem
  def self.title
    "Find the sum of all numbers which are equal to the sum of the factorial of their digits."
  end

  UPPER_BOUND = 100_000

  def self.solve
    facts = { 0 => 1, 1 => 1 }
    (2..9).each { |n| facts[n] = facts[n - 1] * n }
    curious = []
    (10..UPPER_BOUND).each do |number|
      curious << number if number == number.to_s.each_char.map { |d| facts[d.to_i] }.reduce(:+)
    end
    curious.reduce(:+)
  end
end
