class RadixSort
  def self.go!(input)
    pow10 = 1
    max_value = max(input)
    sorted = input
    while max_value/pow10 > 0 do
      sorted = counting_sort(sorted, pow10)
      pow10 = pow10 * 10
    end
    return sorted
  end

  def self.counting_sort(input, pow10)
    output = Array.new(input.length)
    count = Array.new(10){ 0 }

    input.each do |i|
      sortable_index = (i / pow10) % 10
      count[sortable_index] += 1
    end

    for i in (1..count.length - 1) do
      count[i] += count[i - 1]
    end

    input.reverse.each do |i|
      sortable_index = (i / pow10) % 10
      output_index = count[sortable_index] - 1
      output[output_index] = i
      count[sortable_index] -= 1
    end

    return output
  end

  def self.max(input)
    m = 0
    input.each do |i|
      m = i if i > m
    end
    return m
  end
end
