class HeapSort
  def self.go!(input)
    max_heap = make_max_heap(input)
    pointer = max_heap.length - 1
    while pointer > 1 do
      max = max_heap[0]
      max_heap[0] = max_heap[pointer]
      max_heap[pointer] = max
      pointer -= 1
      max_heapify(max_heap, pointer, 0)
    end
    if max_heap[0] > max_heap[1]
      min = max_heap[1]
      max_heap[1] = max_heap[0]
      max_heap[0] = min
    end
    output = max_heap
    return output
  end

  def self.make_max_heap(array)
    level_2_start = array.length / 2
    (0..level_2_start).to_a.reverse.each do |i|
      max_heapify(array, array.length - 1, i)
    end
    return array
  end

  def self.max_heapify(array, heap_top, i)
    left = i * 2
    right = left + 1
    value = array[i]
    largest = i
    if left <= heap_top && value < array[left]
      largest = left
      if right <= heap_top && array[right] > array[left]
        largest = right
      end
    elsif right <= heap_top && value < array[right]
      largest = right
    end
    if largest != i
      array[i] = array[largest]
      array[largest] = value
      max_heapify(array, heap_top, largest)
    end
    return array
  end
end
