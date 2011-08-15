class Problem43 < Problem
  def self.title
    "Find the sum of all pandigital numbers with an unusual sub-string divisibility property."
  end

  def self.solve
    unusuals = []
    (17..999).each do |num|
      if num % 17 == 0
        str = num.to_s
        str = "0" + str if str.length == 2
        unusuals << str unless str.has_dups?
      end
    end

    [13, 11, 7, 5, 3, 2].each do |p|
      new_unusuals = []
      unusuals.each do |u|
        "0123456789".each_char do |d|
          unless u.index(d)
            test = d + u
            new_unusuals << test if test[0..2].to_i % p == 0
          end
        end
      end
      unusuals = new_unusuals
    end

    unusuals.each_index do |i|
      u = unusuals[i]
      "0123456789".each_char do |d|
        unusuals[i] = d + u unless u.index(d)
      end
    end

    unusuals.map {|s| s.to_i}.reduce(:+)
  end
end
