class Problem17 < Problem
  def self.title
    "How many letters would be needed to write all the numbers in words from 1 to 1000?"
  end

  NUMKEY = { 1 => "one",
             2 => "two",
             3 => "three",
             4 => "four",
             5 => "five",
             6 => "six",
             7 => "seven",
             8 => "eight",
             9 => "nine",
             10 => "ten",
             11 => "eleven",
             12 => "twelve",
             13 => "thirteen",
             14 => "fourteen",
             15 => "fifteen",
             16 => "sixteen",
             17 => "seventeen",
             18 => "eighteen",
             19 => "nineteen",
             20 => "twenty",
             30 => "thirty",
             40 => "forty",
             50 => "fifty",
             60 => "sixty",
             70 => "seventy",
             80 => "eighty",
             90 => "ninety",
             100 => "hundred",
             1000 => "onethousand" }
  
  def self.translate(num) 
    # if I don't convert to integers now, ruby will save the fraction
    hundreds = (num / 100).to_i
    tens = ((num % 100) / 10).to_i
    units = num % 10
    
    result = ""
    if hundreds > 0
      result << (NUMKEY[hundreds] + NUMKEY[100])
      if num % 100 > 0
        result << "and"
      end
    end
    if tens == 1
      result << NUMKEY[tens * 10 + units]
    else
      if tens > 1
        result << NUMKEY[tens * 10]
      end
      if units > 0
        result << NUMKEY[units]
      end
    end
    
    if num == 1000
      result = NUMKEY[1000]
    end
    
    return result
  end
  
  def self.solve
    length = 0
    (1..1000).each do |num|
      length += translate(num).length
    end
    return length
  end
end
