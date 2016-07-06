class CountingSort
  def self.go!(input, max = nil)
    output = Array.new(input.length)

    if max.nil?
      max = 0
      input.each do |val|
        max = val if val > max
      end
    end

    counting_array = Array.new(max + 1){ 0 }
    
    input.each do |val|
      counting_array[val] += 1
    end

    (1..counting_array.length-1).each do |i|
      counting_array[i] += counting_array[i-1]
    end

    (0..input.length-1).to_a.reverse.each do |i|
      input_value = input[i]
      output_index = counting_array[input_value]
      output[output_index-1] = input_value
      counting_array[input_value] -= 1
    end

    return output

  end
end
