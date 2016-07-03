class QuickSort
  def self.go!(input, lower_bound = 0, top_index = input.length - 1)
    return input if top_index - lower_bound <= 1
    pivot = input[top_index]
    divider = lower_bound
    upper_bound = lower_bound
    while upper_bound < top_index do
      current_value = input[upper_bound]
      if pivot > current_value
        input[upper_bound] = input[divider]
        input[divider] = current_value
        divider += 1
      end
      upper_bound += 1
    end
    input[top_index] = input[divider]
    input[divider] = pivot
    QuickSort.go!(input, lower_bound, divider-1)
    QuickSort.go!(input, divider, top_index)
    return input
  end
end
