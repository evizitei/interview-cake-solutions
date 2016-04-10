def get_products_of_all_ints_except_at_index(input)
  output = []
  index = 0
  left_product = 1
  right_product = 1
  while(index < input.length) do
    right_index = input.length - (1+index)
    output[index] = (output[index] || 1) * left_product
    output[right_index] = (output[right_index] || 1) * right_product
    left_product = left_product * input[index]
    right_product = right_product * input[right_index]
    index += 1
  end

  return output
end
