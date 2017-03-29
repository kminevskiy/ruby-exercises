class House

  def self.recite
    who.reverse.each_with_index.map do |someone, index|
      index == 0 ? 'This is ' + someone + "\n\n" :
      'This is ' + someone + "\n" + what_who[-index..-1].join("\n") + "\n\n"
    end.join[0..-2]
  end

  private

  #subjects array, e.g. 'the dog'
  def self.who
    result = pieces.map { |sub| sub[0] }
    result[-1] << '.'
    result
  end

  #actions array, e.g. 'that belonged to'
  def self.what
    pieces.map { |sub| sub[1] }.compact
  end

  def self.what_who
    what.zip(who[1..-1]).map { |string_to_be| string_to_be.join(' ') }
  end

  def self.pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
