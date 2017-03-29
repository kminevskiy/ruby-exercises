class WordProblem
  def initialize(string)
    @string = prepare_string(string)
  end

  def prepare_string(input)
    input.sub('?', '').partition('is ').last
  end

  def operands_number
    @string.split(' ').count { |elem| elem.to_i != 0 }
  end

  def prepare_operators(operands_number)
    (operands_number - 1).times do
      if @string.include?('plus')
        @string.sub!('plus', '+')
      elsif @string.include?('minus')
        @string.sub!('minus', '-')
      elsif @string.include?('multiplied by')
        @string.sub!('multiplied by', '*')
      elsif @string.include?('divided by')
        @string.sub!('divided by', '/')
      end
    end
  end

  def answer
    raise ArgumentError if operands_number < 2
    prepare_operators(operands_number)
    ary = @string.split(' ').map { |e| e.to_i != 0 ? e.to_i  : e }
    if ary.size == 3
      ary.first.send ary[1], ary[2]
    else
      (ary.first.send ary[1], ary[2]).send ary[-2], ary.last
    end
  end
end
