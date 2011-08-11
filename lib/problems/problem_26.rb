class Problem26 < Problem
  def self.title
    "Find the value of d < 1000 for which 1/d contains the longest recurring cycle."
  end

  def self.solve
    # We're doing long division. The recurring cycle is as long as
    # the number of long division cycles run until we repeat ourselves

    max_cycle = 0
    max_cycle_integer = 1
    (2..1000).each do |divisor|
      dividend = 1
      operations = []
      terminated = false
      until terminated do
        while dividend < divisor do
          dividend *= 10
        end
        operation = dividend.divmod(divisor)
        repeated_op = operations.find_index {|op| op == operation}
        if repeated_op
          terminated = true
          cycle = operations.length - repeated_op
          if cycle > max_cycle
            max_cycle = cycle
            max_cycle_integer = divisor
          end
        elsif operation[1] == 0
          # the decimal is terminating, not repeating
          terminated = true
        else
          operations << operation
          dividend = operation[1]
        end
      end
    end
    max_cycle_integer
  end
end
