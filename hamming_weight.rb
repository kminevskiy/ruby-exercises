# Write a function that takes an unsigned integer and returns the number of ’1' bits it has (also known as the Hamming weight).
# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  n.to_s(2).count('1')
end