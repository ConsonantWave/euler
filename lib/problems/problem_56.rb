class Problem56 < Problem
  def self.title
    "Considering natural numbers of the form, a^b, finding the maximum digital sum."
  end

  def self.solve
    max = 0
    (2..100).each do |a|
      (2..100).each do |b|
        digit_sum = (a ** b).to_s.each_char.reduce(0) { |acc, d| acc += d.to_i }
        max = digit_sum if digit_sum > max
      end
    end
    max
  end
end
