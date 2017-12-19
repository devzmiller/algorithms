def rotated?(str1, str2)
  arr1 = str1.split("")
  arr2 = str2.split("")
  return false if arr1.sort != arr2.sort
  first_char_index = arr2.index(arr1[0])
  if arr2[0...first_char_index] == arr2[(arr1.length - first_char_index)..-1]
    return true
  end
  return false
end
