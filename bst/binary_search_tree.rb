class Bst
  attr_reader :data, :left, :right

  def initialize(number)
    @data = number
  end

  def insert(new_number)
    if new_number <= @data
      if @left
        @left.insert(new_number)
      else
        @left = Bst.new(new_number)
      end
    else
      if @right
        @right.insert(new_number)
      else
        @right = Bst.new(new_number)
      end
    end
  end
end