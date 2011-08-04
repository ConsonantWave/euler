class Problem5 < Problem
  def self.title
    "What is the smallest number divisible by each of the numbers 1 to 20?"
  end

  def self.solve
    n = 20
    primes = [2,3,5,7,11,13,17,19]
    factors = primes.map {|p| Math.log(n, p).floor }
    (0...primes.length).reduce(1) {|product, i| product * (primes[i] ** factors[i]) }
  end
end
