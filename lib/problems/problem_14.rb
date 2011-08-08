class Problem14 < Problem
  def self.title
    "Find the longest sequence using a starting number under one million."
  end

  LIMIT = 1000000
  
  def self.seq_length(i)
    if @@seq_lengths.has_key? i
      return @@seq_lengths[i]
    else
      @@seq_lengths[i] = 1 + (i % 2 == 1 ? seq_length(3 * i + 1) : seq_length(i / 2))
      return @@seq_lengths[i]
    end
  end
  
  def self.solve
    @@seq_lengths = { 1 => 1 }
    max_length = 1
    max_starter = 1
    (2..LIMIT).each do |i|
      length = seq_length(i)
      if length > max_length
        max_length = length
        max_starter = i
      end
    end
    return max_starter
  end
end
