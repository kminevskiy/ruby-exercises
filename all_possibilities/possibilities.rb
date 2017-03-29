def to_100
  numbers = ('1'..'9').to_a
  ary = []
  ['+', '-', ''].repeated_permutation(8).to_a.each do |operations|
    string = numbers.zip(operations).join
    ary << string if (eval string) == 100
  end
  ary
end

puts to_100