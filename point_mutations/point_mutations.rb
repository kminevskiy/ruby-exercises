class DNA
  def initialize(initial_strand)
    @strand = initial_strand
  end

  def hamming_distance(other_strand)
    diffs = @strand.chars.zip(other_strand.chars).reject do |pair|
      pair.first == pair.last || pair.include?(nil)
    end
    diffs.length
  end
end