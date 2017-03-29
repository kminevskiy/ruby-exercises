def two_sum(nums, target)
  sub_ary = nums.combination(2).find do |a, b|
     a + b == target
  end
  [nums.index(sub_ary[0]), nums.index(sub_ary[1])]
end