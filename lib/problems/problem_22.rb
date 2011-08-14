class Problem22 < Problem
  def self.title
    "What is the total of all the name scores in the file of first names?"
  end

  def self.name_value(name)
    sum = 0
    name.each_byte do |ch|
      sum += ch - 64
    end
    return sum
  end
  
  def self.solve
    name_list = ""
    File.open("public/names.txt") do |file|
      name_list = file.gets.chomp
    end
    names = name_list.split(",")
    names = names.map { |name| name.delete("\"")}
    names.sort!
    sum = 0
    (0...names.length).each do |i|
      sum += (i + 1) * name_value(names[i])
      puts "#{i+1}. #{names[i]} (value: #{name_value(names[i])})"
    end
    return sum
  end
end
