def to_currency(string_amount)
  natural, fraction = string_amount.to_f.round(2).to_s.scan(/\d+/)
  fraction = fraction.size == 1 ? fraction + '0' : fraction

  formated_string = natural.reverse.scan(/.{3}|.{1,}/).join(',').reverse

  "$#{formated_string}.#{fraction}"
end


p to_currency("100000")       # => "$100,000.00"
p to_currency("3456789879.1") # => "$3,456,789,879.10"
p to_currency("12343.43")     # => "$12,343.43"
p to_currency("12343.100")    # => "$12,343.10"
p to_currency("12343.996")    # => "$12,344.00"