class Problem9 < Problem
  def self.title
    "Find the only Pythagorean triplet, {a, b, c}, for which a + b + c = 1000."
  end

  def self.solve
    perimeter = 1000
    3.upto((perimeter - 3)/3) do |a|
      (a+1).upto((perimeter - a)/2 - 1) do |b|
        c = perimeter - a - b
        return a * b * c if c * c == a * a + b * b
      end
    end
  end
end
