def longest_sub(target, array)
  longest = 0
  array.each_with_index do |num, i|
    if num > target
      next
    elsif num == target
      if longest < 1
        longest = 1
      end
    else
      length = 1
      sum = num
      array[i+1..-1].each do |num2|
        if sum + num2 < target
          sum += num2
          length += 1
        elsif sum + num2 == target
          length += 1
          if length > longest
            longest = length
          end
          break
        else
          break
        end
      end
    end
  end
  longest
end

# doesn't work for odd numbers. fix later

test1 = [10, 5, 2, 7, 1, 9]
test2 = [-5, 8, -14, 2, 4, 12]
test3 = [-1, 2, 3]
p longest_sub(15, test1).to_s + " should equal 4"
p longest_sub(-5, test2).to_s + " should equal 5"
p longest_sub(6, test3).to_s + " should equal 0"