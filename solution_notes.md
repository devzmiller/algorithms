**Q: Check if a string has all unique characters without using any other data structures. (Cracking the Coding Interview)**

Ask:
* What types of characters? All alphabet? Lowercase/uppercase (and is it case sensitive)? Numeric? All possible characters? ASCII encoded or Unicode.
* What to do with empty string?
* What to do with non-string argument?

Answer:
	Assumes ASCII, raise error if wrong datatype given, return true for empty string

```ruby
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
```

Alternate answer:
  Sort the string and then compare each character to its neighboring character. Less efficient though.

**Q: Given two strings, write a method to decide if one is a permutation of the other.**

Ask:
* Does case matter? Does whitespace matter?

Answer:
  Assumes simplicity matters more than efficiency. A more efficient solution would be to count the occurrences of each character in each string and then make sure those counts match.

```ruby
def anagrams?(str1, str2)
  return false if str1.length != str2.length
  arr1 = str1.split("").sort
  arr2 = str2.split("").sort
  return false if arr1 != arr2
  true
end
```

**Q: Replace spaces in a string with "%20".**

Ask:
* Will you encounter multiple spaces in a row? How should they be handled?
* How should spaces at the beginning and end of the string be handled?

Answer:
	Assumes that spaces at the beginning and end should not be replaced with "%20" and instead just be stripped. Assumes that multiple spaces in a row should only be replaced with one "%20"

```ruby
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
```

**Q: String compression. Given a string "aaabccdddd", the method should return "a3b1c2d4". If the compressed string isn't actually any shorter than the given string, return the given string instead.**

Answer:
	Using the shovel operator modifies the new_string in place, whereas += would copy it over to a new string, so shovel saves time/space.

```ruby
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
```

Notes:
	You forgot to add the final character and its count to the new_string.

**Q: Given an NxN matrix, write a method to rotate the matrix 90 degrees. Can you do it in place?**

Answer:
	This version does not do it in place, and works row by row.

```ruby
def rotate(matrix)
  i = 0
  j = 0
  i_plus = 0
  j_plus = matrix.length - 1
  new_matrix = Array.new(matrix.length) { Array.new(matrix.length) {nil} }
  while i < matrix.length
    i_plus = 0 - i
    j_plus = matrix.length - 1 - i
    while j < matrix.length
      new_matrix[i + i_plus][j + j_plus] = matrix[i][j]
      i_plus += 1
      j_plus -= 1
      j += 1
    end
    j = 0
    i += 1
  end
  new_matrix
end
```

Answer Version 2:
	This version should rotate in place, by working ring at a time instead of row (ie all outer cells, then the next layer in, etc).
