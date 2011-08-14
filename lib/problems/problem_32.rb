class Problem32 < Problem
  def self.title
    "Find the sum of all numbers that can be written as pandigital products."
  end

  def self.solve
    ones = (1..9).to_a
    twos = (10..99).find_all { |num| num.digits_unique? }
    threes = (100..999).find_all { |num| num.digits_unique? }
    fours = (1000..9999).find_all { |num| num.digits_unique? }
    products = {}
    
    ones.each do |md|
      fours.each do |mr|
        pr = md*mr
        if pr.digits_unique? and (md.to_s + mr.to_s + pr.to_s).pandigital?
          products[pr] = true
        end
      end
    end
    
    twos.each do |md|
      threes.each do |mr|
        pr = md*mr
        if pr.digits_unique? and (md.to_s + mr.to_s + pr.to_s).pandigital?
          products[pr] = true
        end
      end
    end
    
    return products.keys.reduce(:+)
  end
end
