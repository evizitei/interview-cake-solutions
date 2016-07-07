class MergeSort
  def self.go!(input)
    return input if input.length <= 1

    sorted = []
    pivot = input.length/2
    left_half = MergeSort.go!(input[0..pivot-1])
    right_half = MergeSort.go!(input[pivot..(input.length - 1)])
    while left_half.length > 0 && right_half.length > 0 do
      left = left_half.first
      right = right_half.first
      if left < right
        sorted.push(left_half.shift)
      else
        sorted.push(right_half.shift)
      end
    end

    if left_half.length > 0
      left_half.each {|val| sorted.push(val) }
    elsif right_half.length > 0
      right_half.each {|val| sorted.push(val) }
    end

    return sorted
  end
end
