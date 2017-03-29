def translate(string)
  consonants = %w(B C D F G H J K L M N P Q R S T V X Z b c d f g h j k l m n p q r s t v x z)
  index = 0
  while index < string.size
    if consonants.include?(string[index])
      string.insert(index + 1, string[index])
      string.insert(index + 1, 'o')
      index += 3
    else
      index += 1
    end
  end
  string
end