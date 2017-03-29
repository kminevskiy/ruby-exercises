# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  nums.size.times do |idx|
    nums.delete_at(idx) if nums.count(nums.at(idx)) > 2
  end
  nums
end

nums = [-40,-40,-40,-40,-40,-40]

p remove_duplicates(nums)