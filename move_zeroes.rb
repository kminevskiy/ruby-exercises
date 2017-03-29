def move_zeroes(nums)
  without_zeroes = nums.size - nums.reject { |e| e == 0 }.size
  nums.reject! { |e| e == 0 }
  without_zeroes.times { nums.push(0) }
  nil
end

nums = [0, 1, 0, 3, 12]
move_zeroes(nums)
p nums