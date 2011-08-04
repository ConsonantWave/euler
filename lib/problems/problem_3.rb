require 'mathn'

class Problem3 < Problem
  def self.title
    "Find the largest prime factor of a composite number."
  end

  def self.solve
    number = 600851475143
    generator = Prime.each
    until number == 1 do
      prime = generator.next
      number /= prime if number % prime == 0
    end
    prime
  end
end
