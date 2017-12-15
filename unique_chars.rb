def unique_chars?(string)
  raise ArgumentError if string.class != String
  poss_chars = Array.new(256) { false }
  i = 0
  while i < string.length
    ord = string[i].ord
    if poss_chars[ord] == true
      return false
    else
      poss_chars[ord] = true
    end
    i += 1
  end
  true
end
