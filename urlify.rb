def urlify(string)
  i = 0
  while i < string.length
    string.strip!
    if string[i] == " " && string[i-3..i-1] == "%20"
      string.slice!(i)
    elsif string[i] == " "
      string[i] = "%20"
      i += 1
    else
      i += 1
    end
  end
  string
end
