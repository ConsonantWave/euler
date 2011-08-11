require 'mathn'

class Problem27 < Problem
  def self.title
    "Find a quadratic formula that produces the maximum number of primes for consecutive values of n."
  end
  
  def self.solve
    primes = {}
    Prime.each(1_000_000) { |p| primes[p] = true }
    max_n, max_a, max_b = 0, -1000, -1000
    
    (-1000..1000).each do |a|
      (-1000..1000).each do |b|
        n = 0
        while primes[n*n + a*n + b]
          n += 1
        end
        if n > max_n
          max_n, max_a, max_b = n, a, b
        end
      end
    end
    
    max_a * max_b
  end
end
