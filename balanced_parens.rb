MATCHES = {
  '[' => ']',
  '(' => ')',
  '{' => '}'
}

def balanced_parens(string)
  stack = Array.new
  i = 0
  while i < string.length
    char = string[i]
    if char == '(' || char == '{' || char == '['
      stack.push(char)
    elsif char == ')' || char == '}' || char == ']'
      match = stack.pop
      return i if MATCHES[match] != char
    end
    i += 1
  end
  true
end

test1 = "({[abcd]eee})"
test2 = "({abcde[})"
test3 = "abcd()ef"
test4 = "]"
p "this should return true"
p balanced_parens(test1)
p "thisg hsould return 8"
p balanced_parens(test2)
p 'this should reutrn true'
p balanced_parens(test3)
p 'this should return 0'
p balanced_parens(test4)
