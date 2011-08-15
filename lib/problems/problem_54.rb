class Problem54 < Problem
  def self.title
    "How many hands did player one win in the game of poker?"
  end

  def self.solve
    count = 0
    File.open("public/poker.txt") do |file|
      file.each_line do |line| 
        cards = line.split(" ")
        hand_1, hand_2 = Hand.new(cards[0..4]), Hand.new(cards[5..9])
        count += 1 if hand_1 > hand_2
      end
    end
    count
  end
end

class Hand
  include Comparable

  attr_reader :cards, :suits, :ranks

  def initialize(card_strs)
    @cards = card_strs.map { |str| Card.new(str) }
    @suits = {}
    @ranks = {}
    @cards.each do |card|
      @suits[card.suit] ||= 0
      @suits[card.suit] += 1
      @ranks[card.rank] ||= 0
      @ranks[card.rank] += 1
    end
  end

  def to_s
    cards.reduce("") { |str, card| str << card.to_s << " " }
  end

  def analyze
    sorted_ranks = ranks.keys.sort.reverse
    if suits.length == 1 # we have a flush
      if sorted_ranks[0] - sorted_ranks[4] == 4
        return [Hands::STRAIGHT_FLUSH, sorted_ranks[0]]
      else
        return [Hands::FLUSH] + sorted_ranks # save the whole thing, just in case
      end
    elsif ranks.key(4)
      sorted_ranks.delete(ranks.key(4))
      return [Hands::FOUR_OF_A_KIND, ranks.key(4), sorted_ranks[0]]
    elsif ranks.key(3)
      if ranks.length == 2 # full house
        return [Hands::FULL_HOUSE, ranks.key(3)]
      else
        return [Hands::THREE_OF_A_KIND, ranks.key(3)]
      end
    elsif ranks.key(2)
      if ranks.length == 3 # two pair
        sorted_ranks.delete(ranks.key(1))
        return [Hands::TWO_PAIRS] + sorted_ranks
      else
        sorted_ranks.delete(ranks.key(2))
        return [Hands::ONE_PAIR, ranks.key(2)] + sorted_ranks
      end
    else
      if sorted_ranks[0] - sorted_ranks[4] == 4
        return [Hands::STRAIGHT, sorted_ranks[0]]
      else
        return [Hands::HIGH_CARD] + sorted_ranks
      end
    end
  end

  def <=>(other_hand)
    this_analysis = analyze
    other_analysis = other_hand.analyze
    this_analysis.each_index do |i|
      comparison = this_analysis[i] <=> other_analysis[i]
      return comparison unless comparison == 0
    end
    return 0
  end
end

class Card
  attr_reader :code, :suit, :rank

  def initialize(code)
    @code = code
    @suit = code[1]
    @rank = case code[0]
            when "A"
              14
            when "K"
              13
            when "Q"
              12
            when "J"
              11
            when "T"
              10
            else
              code[0].to_i
            end
  end

  def to_s
    code
  end
end

class Hands
  HIGH_CARD = 0
  ONE_PAIR = 1
  TWO_PAIRS = 2
  THREE_OF_A_KIND = 3
  STRAIGHT = 4
  FLUSH = 5
  FULL_HOUSE = 6
  FOUR_OF_A_KIND = 7
  STRAIGHT_FLUSH = 8
  # A royal flush is just the highest possible straight flush
end
