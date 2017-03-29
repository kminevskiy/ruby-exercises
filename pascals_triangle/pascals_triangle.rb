class Triangle
  def initialize(rows_number)
    @rows_number = rows_number - 1
    @rows = []
  end

  def rows
    @rows.push([1]) if @rows.empty?

    @rows_number.times do
      row_elements = @rows.last.each_cons(2).map do |pair|
        pair.reduce(:+)
      end
      @rows << @rows[0] + row_elements + @rows[0]
    end
    @rows
  end
end