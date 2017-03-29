class Luhn
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def addends
    reversed = number.to_s.split('').reverse
    new_ary = Array.new
    reversed.each_with_index do |number, index|
      if (index + 1) % 2 == 0
        if (number.to_i * 2) >= 10
          new_ary.push((number.to_i * 2 - 9))
        else
          new_ary.push(number.to_i * 2)
        end
      else
        new_ary.push(number.to_i)
      end
    end
    new_ary.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(n)
    luhn = Luhn.new(n)
    modified = luhn
    counter = 0
    while !modified.valid?
      modified.number = luhn.number.to_s + counter.to_s
      modified.valid? ? break : modified.number = n; counter += 1
    end
    modified.number.to_i
  end
end
