#!/bin/ruby

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
positive, negative, zero = [], [], []
arr.each do |n|
  if n > 0
    positive.push(n)
  elsif n < 0
    negative.push(n)
  else
    zero.push(n)
  end
end

puts ('%.6f' % (positive.size / Float(arr.size)))
puts ('%.6f' % (negative.size / Float(arr.size)))
puts ('%.6f' % (zero.size / Float(arr.size)))