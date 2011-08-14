class Problem25 < Problem
  def self.title
    "What is the first term in the Fibonacci sequence to contain 1000 digits?"
  end

  DIGIT_COUNT = 1000
  
  def self.solve
    first = 1
    second = 1
    count = 2
    until second.to_s.length == DIGIT_COUNT
      next_fib = first + second
      count += 1
      first = second
      second = next_fib
    end
    return count
  end
end
