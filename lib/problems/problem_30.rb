class Problem30 < Problem
  def self.title
    "Find the sum of all the numbers that can be written as the sum of fifth powers of their digits."
  end

  LIMIT = 1000000 # arbitrary limit, but it happens to work
  
  def self.solve
    sum = 0
    (10...LIMIT).each do |n|
      digit_fifth_sum = 0
      n.to_s.each_char { |ch| digit_fifth_sum += (ch.to_i ** 5) }
      if n == digit_fifth_sum
        puts "works for #{n}"
        sum += n
      end
    end
    sum
  end
end
