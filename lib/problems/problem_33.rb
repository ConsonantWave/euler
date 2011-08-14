require 'rational'

class Problem33 < Problem
  def self.title
    "Discover all the fractions with an unorthodox cancelling method."
  end

  def self.solve
    pairs = []
    (10..98).each {|n| (n+1..99).each { |d| pairs << PeculiarPair.new(n,d) } }
    valid_pairs = pairs.select { |p| p.valid? }
    return valid_pairs.reduce { |product, p| product.to_r * p.to_r }.denominator
  end
end

class PeculiarPair
  def initialize(n,d)
    raise "More than two digits" if n.to_s.length > 2 or d.to_s.length > 2
    raise "Fraction greater than or equal to 1" if n >= d
    @n = n
    @d = d
  end
  
  def to_r
    Rational(@n,@d)
  end
  
  def valid?
    crossed_out = cross_out
    crossed_out and crossed_out[1] != 0 and Rational(@n, @d) == Rational(crossed_out[0], crossed_out[1])
  end
  
  private
  def cross_out
    n_str, d_str = @n.to_s, @d.to_s
    if n_str[0] == d_str[1]
      return [n_str[1].to_i, d_str[0].to_i]
    end
    if n_str[1] == d_str[0]
      return [n_str[0].to_i, d_str[1].to_i]
    end
    return nil
  end
end
