def smash(string)
  string.scan(/[a-zA-Z]/).join(' ')
end

puts(smash('Hello, world!')) #=> H e l l o w o r l d