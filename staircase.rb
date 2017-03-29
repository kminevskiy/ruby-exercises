#!/bin/ruby

n = gets.strip.to_i
(1..n).each { |num| puts(' ' * (n-num) + '#' * num) }