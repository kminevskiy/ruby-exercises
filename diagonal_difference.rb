
#Given a square matrix of size N×N , calculate the absolute difference between the sums of its diagonals.
#!/bin/ruby

n = gets.strip.to_i
a = Array.new(n)
for a_i in (0..n-1)
    a_t = gets.strip
    a[a_i] = a_t.split(' ').map(&:to_i)
end
final_ary = Array.new
a.each_with_index { |ary, index| final_ary.push(ary[index]) }
a.reverse.each_with_index { |ary, index| final_ary.push(ary[index]) }
puts final_ary.each_slice(final_ary.size / 2).map { |ary| ary.reduce(:+) }.reduce(:-).abs