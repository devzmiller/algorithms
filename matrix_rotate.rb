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
