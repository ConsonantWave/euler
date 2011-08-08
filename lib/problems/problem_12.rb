class Problem12 < Problem
  def self.title
    "What is the value of the first triangle number to have over five hundred divisors?"
  end

  MIN_DIVISORS = 500

  def self.solve
    triangle = 0
    count = 0
    divisors = 0
    while divisors < MIN_DIVISORS
      count += 1
      triangle += count
      divisors = 0
      triangle_root = Math.sqrt(triangle)

      (1..triangle_root.floor).each do |test|
        if triangle % test == 0
          divisors += 2
        end
      end
      # check if triangle is square number, because divisors would get overcounted
      if triangle_root - triangle_root.floor == 0
        divisors -= 1
      end
    end

    return triangle
  end
end
