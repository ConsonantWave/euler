class Problem7 < Problem
  def self.title
    "Find the 10001st prime."
  end

  def self.solve
    # I could use the prime generator but that would be cheating.
    primes = [2]
    test = 3
    until primes.length == 10001
      max = Math.sqrt(test)
      primes.each do |p|
        if p > max
          primes << test
          break
        end
        break if test % p == 0
      end
      test += 2
    end
    primes.last
  end
end
