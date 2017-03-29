PAIRS = {
  'M' => 1000,
  'CM' => 900,
  'D' => 500,
  'CD' => 400,
  'C' => 100,
  'XC' => 90,
  'L' => 50,
  'XL' => 40,
  'X' => 10,
  'IX' => 9,
  'V' => 5,
  'IV' => 4,
  'I' => 1
}

class Fixnum
  def to_roman
    result = ''
    number = self
    PAIRS.each do |roman_number, value|
      number_of_roman_letters = number / value
      result += roman_number * number_of_roman_letters
      number -= number_of_roman_letters * value
    end
    result
  end
end