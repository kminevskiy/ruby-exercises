class Palindrome
  attr_accessor :factors, :value

  def initialize
    @factors = Array.new
  end
end

class Palindromes
  attr_reader :start, :finish
  attr_accessor :palindrome

  def initialize(options)
    @start = options[:min_factor] || 1
    @finish = options[:max_factor]
    @palindrome = Hash.new
  end

  def generate
    (start..finish).each do |num|
      (num..finish).each do |sub_num|
        if (num * sub_num).to_s == (num * sub_num).to_s.reverse
          product = num * sub_num
          palindrome[product] = Palindrome.new
          palindrome[product].value = num * sub_num
          palindrome[product].factors.push([num, sub_num])
        end
      end
    end
    palindrome
  end

  def largest
    palindrome[palindrome.keys.max]
  end

  def smallest
    palindrome[palindrome.keys.min]
  end
end