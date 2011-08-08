class Problem9 < Problem
  def self.title
    "Find the only Pythagorean triplet, {a, b, c}, for which a + b + c = 1000."
  end

  SUM = 1000

  def self.solve
    a = 0
    b = 0
    c = 1

    until (a*a) + (b*b) == (c*c)
      a += 1
      b = (SUM - a) / 2
      c = (SUM - a) / 2
      if a % 2 == 1
        c += 1
      end

      until b <= a or (a*a) + (b*b) == (c*c)
        b -= 1
        c += 1
      end
    end

    puts "a: #{a}, b: #{b}, c: #{c}"
    return a*b*c
  end
end
