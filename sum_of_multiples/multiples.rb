class SumOfMultiples
  DEFAULTS = [3, 5]

  def initialize(*args)
    @args = args
  end

  def self.to(limit, values = DEFAULTS)
    multiples = []
    values ||= @args
    (1...limit).each do |element|
      if values.any? { |value| element % value == 0 }
        multiples.push(element)
      end
    end
    multiples.reduce(0, :+)
  end

  def to(limit)
    self.class.to(limit, @args)
  end
end
