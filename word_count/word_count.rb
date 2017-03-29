class Phrase
  def initialize(sentence)
    @sentence = sentence.downcase.scan(/[a-z0-9']+/)
  end

  def word_count
    remove_quotes.each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
  end

  private

  def remove_quotes
    @sentence.each { |word| word.gsub!(/^'|'$/, '') }
  end
end