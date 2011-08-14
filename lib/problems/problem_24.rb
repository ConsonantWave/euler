class Problem24 < Problem
  def self.title
    "What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?"
  end

  WANTED_PERM = 1000000
  
  def self.solve
    [0,1,2,3,4,5,6,7,8,9].permutation.to_a[WANTED_PERM - 1].reduce("") {|str, i| str << i.to_s }
  end
end
