def reverse(x)
  return 0 if x.abs > (2 ** 30 - 1)
  return x.to_s.reverse.to_i if x > 0
  x.to_s.reverse.to_i * -1
end