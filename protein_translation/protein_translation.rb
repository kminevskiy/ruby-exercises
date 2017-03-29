PROTEIN_INFO = {Methionine: ['AUG'], Phenylalanine: ['UUU', 'UUC'],
                Leucine: ['UUA', 'UUG'], Serine: ['UCU', 'UCC', 'UCA', 'UCG'],
                Tyrosine: ['UAU', 'UAC'], Cysteine: ['UGU', 'UGC'],
                Tryptophan: ['UGG'], STOP: ['UAA', 'UAG', 'UGA']}

class InvalidCodonError < StandardError
end

class Translation

  def self.of_codon(codon)
    PROTEIN_INFO.select do  |_, codons|
      codons.include?(codon)
    end.keys.join
  end

  def self.of_rna(rna)
    proteins = Array.new
    raise InvalidCodonError unless PROTEIN_INFO.values.flatten.include?(rna.scan(/.../).sample)
    rna.scan(/.../).each do |codon|
      return proteins if PROTEIN_INFO[:STOP].include?(codon)
      proteins.push(PROTEIN_INFO.select { |_, c| c.include?(codon)}.keys.join)
    end
    proteins
  end
end