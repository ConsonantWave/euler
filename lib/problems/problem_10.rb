class Problem10 < Problem
  def self.title
    "Calculate the sum of all the primes below two million."
  end

  def self.solve
    limit = 2_000_000
    sieve = {2 => true}
    (3..limit).step(2).each do |n|
      unless sieve.has_key?(n)
        sieve[n] = true
        ((n*3)..limit).step(n*2).each { |m| sieve[m] = false }
      end
    end
    sieve.keys.reduce(0) { |sum, acc| sieve[acc] ? sum + acc : sum }
  end
end
