def add_digits(num)
  raise ArgumentError, 'Only positive integers are allowed' if num < 0 || !num.is_a?(Fixnum)
  digital_root = 1 + ((num - 1) % 9)
  num > 0 ? digital_root : 0
end

p add_digits(9)