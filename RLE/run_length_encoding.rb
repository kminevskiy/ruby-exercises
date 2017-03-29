module RunLengthEncoding
  def self.encode(input)
    input_ary = input.split('')
    final_string = ''
    element_counter = 1
    input_ary.each_index do |idx|
      if input_ary[idx] == input_ary[idx + 1]
        element_counter += 1
      else
        if element_counter == 1
          final_string += input_ary[idx]
        else
          final_string += element_counter.to_s
          final_string += input_ary[idx]
          element_counter = 1
        end
      end
    end
    final_string
  end

  def self.decode(input)
    final_string = ''
    input_ary = input.scan(/\d+|\D+/)
    input_ary.each_index do |idx|
      if input_ary[idx].to_i != 0
        if input_ary[idx + 1].size == 1
          final_string << input_ary[idx + 1] * (input_ary[idx].to_i - 1)
        else
          final_string << input_ary[idx + 1][0] * (input_ary[idx].to_i - 1)
        end
      else
        final_string << input_ary[idx]
      end
    end
    final_string
  end
end