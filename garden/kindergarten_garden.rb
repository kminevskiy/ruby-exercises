PLANTS = { 'R' => :radishes, 'C' => :clover, 'G' => :grass, 'V' => :violets }

class Garden
  attr_reader :alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet, :ileana, :joseph, :kincaid, :larry

  def initialize(plants)
    @upper_row, @bottom_row = separate_plants(plants)
    @alice, @bob, @charlie, @david, @eve, @fred, @ginny, @harriet, @ileana, @joseph, @kincaid, @larry = get_my_plants()
  end

  def get_my_plants
    kids_num = @upper_row.size - 1
    (0..kids_num).each_slice(2).each_with_object([]) do |idx_pair, result|
      i_has_plants = @upper_row[idx_pair[0]..idx_pair[1]] + @bottom_row[idx_pair[0]..idx_pair[1]]
      result << decipher(i_has_plants)
    end
  end

  private

  def separate_plants(plants)
    upper_row, bottom_row = plants.split("\n")
    return upper_row.split(''), bottom_row.split('')
  end

  def decipher(array)
    array.each_with_object([]) { |plant, obj| obj << PLANTS[plant] }
  end
end
