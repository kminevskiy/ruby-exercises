def gcd(a, b)
  [a, b].min.downto(1) do |num|
    return num if a % num == 0 && b % num == 0
  end
end

p gcd(9, 15)
p gcd(100, 11)
p gcd(14, 28)