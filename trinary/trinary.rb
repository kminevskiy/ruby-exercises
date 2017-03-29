class Trinary
  def initialize(tri_num)
    @tri_num = tri_num
    @result = []
  end

  def to_decimal
    return 0 if @tri_num.to_i == 0
    @tri_num.reverse.split('').each_with_index do |number, idx|
      @result << number.to_i * 3 ** idx
    end
    @result.reduce(&:+)
  end
end