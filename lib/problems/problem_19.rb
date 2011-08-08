class Problem19 < Problem
  def self.title
    "How many Sundays fell on the first of the month during the twentieth century?"
  end

  START_DAY = 2
  START_YEAR = 1901
  END_YEAR = 2000
  COMMON_MONTHS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  LEAP_MONTHS = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  
  def self.leap_year?(year)
    (year % 4 == 0 and year % 100 != 0) or year % 400 == 0
  end
  
  def self.solve
    count = 0
    day = START_DAY
    (START_YEAR..END_YEAR).each do |year|
      months = leap_year?(year) ? LEAP_MONTHS : COMMON_MONTHS
      (0...12).each do |month|
        if day == 0
          count += 1
        end
        day = (day + months[month]) % 7
      end
    end
    return count
  end
end
