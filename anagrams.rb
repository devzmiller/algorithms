def anagrams?(str1, str2)
  return false if str1.length != str2.length
  arr1 = str1.split("").sort
  arr2 = str2.split("").sort
  return false if arr1 != arr2
  true
end
