def lowest_number(array)
  array.permutation.to_a.map do |perm|
    perm.join.to_i
  end.min
end

puts lowest_number([23, 550, 1, 80]) # -> 12355080
puts lowest_number([1, 1, 1, 1]) # -> 1111
puts lowest_number([10000, 123, 1890, 11]) # -> 10000111231890
puts lowest_number([1890, 18901]) # -> 189011890
puts lowest_number([12, 33, 11, 9]) # -> 1112339
puts lowest_number([1, 1, 0, 1]) # -> 111
puts lowest_number([1890, 189018901]) # -> 1890189011890