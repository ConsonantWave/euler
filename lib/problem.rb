class Problem
  def self.problems
    ObjectSpace.each_object(Class).select { |klass| klass < self }.sort_by { |klass| klass.to_s[7..-1].to_i }
  end

  def self.id
    self.to_s.delete("Problem").to_i
  end
end
