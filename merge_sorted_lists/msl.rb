def merge(ary, another_ary)
  return ary | another_ary if ary.empty? || another_ary.empty?

  merged = ary + another_ary
  sorted = []
  index = 0
  while index < merged.size
    sorted << merged.delete(merged.min)
  end
  sorted
end

# not finished
