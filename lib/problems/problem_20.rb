class Problem20 < Problem
  def self.title
    "Find the sum of digits in 100!"
  end

  FACT_PARAM = 100
  
  def self.fact(n)
    if n == 1
      return 1
    else
      return n * fact(n - 1)
    end
  end
  
  def self.solve
    fact(FACT_PARAM).to_s.chars.map { |ch| ch.to_i }.reduce(:+)    
  end
end
