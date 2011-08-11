class Problem28 < Problem
  def self.title
    "What is the sum of both diagonals in a 1001 by 1001 spiral?"
  end

  SPIRAL = 1001
  
  def self.solve
    waves = (SPIRAL - 1) / 2 # a wave is a propagation outward of the spiral
    sum = 1
    curr = 1
    1.upto(waves) do |w|
      4.times do
        curr += 2*w
        sum += curr
      end
    end
    sum
  end
end
