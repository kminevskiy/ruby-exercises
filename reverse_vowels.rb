# @param {String} s
# @return {String}

def reverse_vowels(s)
  vowels = s.scan(/[aioue]/i)
  s.gsub(/[aioue]/i) { vowels.pop }
end