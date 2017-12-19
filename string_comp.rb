def string_compression(string)
  new_string = ""
  current_char = string[0]
  count = 1
  i = 1
  while i < string.length
    if string[i] == current_char
      count += 1
    else
      new_string << current_char
      new_string << count.to_s
      current_char = string[i]
      count = 1
    end
    i += 1
  end
  new_string << current_char
  new_string << count.to_s
  return string if string.length <= new_string.length
  new_string
end
