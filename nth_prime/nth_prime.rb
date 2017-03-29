class Prime
  def self.nth(number)
    raise ArgumentError if number < 1
    primes_list = [2]
    prime = primes_list[-1]
    while primes_list.size < number
      prime += 1
      if primes_list.all? { |e| prime % e != 0 }
        primes_list.push(prime)
      end
    end
    primes_list.last
  end
end

p Prime.nth(6)
