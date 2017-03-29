
class Anagram
  def initialize(word)
    @original_word = word
  end

  private

  def compare(other_word)
    return false if @original_word.downcase == other_word.downcase
    @original_word.downcase.chars.sort == other_word.downcase.chars.sort
  end

  public

  def match(words)
    words.select { |word| compare(word) }
  end
end

# without sort
class Anagram
  def initialize(word)
    @original_word = word
  end

  private

  def anagram?(word1, word2)
    return false if word1.downcase == word2.downcase
    word1_hash = word1.downcase.chars.group_by { |letter| letter }
    word2_hash = word2.downcase.chars.group_by { |letter| letter }
    word1_hash.all? { |k, v| word2_hash[k] == v } && word1.size == word2.size
  end

  public

  def match(words)
    words.select { |word| anagram?(@original_word, word) }
  end
end