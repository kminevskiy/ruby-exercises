class Crypto
  attr_reader :string

  def initialize(input_string)
    @string = input_string
  end

  def normalize_plaintext
    string.gsub(/\W/, '').downcase
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext(symbol = '')
    prepare_substrings.map(&:chars).transpose.map(&:join).each do |word|
      word.strip!
    end.join(symbol)
  end

  def normalize_ciphertext
    ciphertext(' ')
  end

  private

  def prepare_substrings
    plaintext_segments.each do |substring|
      if substring.size < size
        size_difference = size - substring.size
        size_difference.times { substring << ' ' }
      end
    end
  end
end
