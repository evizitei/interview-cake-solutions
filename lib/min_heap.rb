class MinHeap
  def initialize
    @data = []
    @head_index = 1
    @insert_index = 1
  end

  def insert(value)
    @data[@insert_index] = value
    up_heap
    @insert_index += 1
  end

  def min
    return @data[@head_index]
  end

  def extract_min
    return_value = min
    swap_last_to(@head_index)
    down_heap
    return return_value
  end

  def delete(target_value)
    search_queue = []
    search_queue.push(@head_index)
    current_index = search_queue.shift
    current_value = @data[current_index]
    while current_value != target_value do
      if target_value >= @data[left_index(current_index)]
        search_queue.push(left_index(current_index))
      end
      if target_value >= @data[right_index(current_index)]
        search_queue.push(right_index(current_index))
      end
      current_index = search_queue.shift
      current_value = @data[current_index]
    end

    if current_value
      swap_last_to(current_index)
      down_heap(current_index)
    end
  end

  private

  def swap_last_to(index)
    @data[index] = @data[@insert_index - 1]
    @data[@insert_index - 1] = nil
    @insert_index -= 1
  end

  def up_heap
    new_node_index = @insert_index
    new_value = @data[new_node_index]
    parent_value = @data[parent_index(new_node_index)]
    while !parent_value.nil? && new_value < parent_value do
      @data[new_node_index] = parent_value
      @data[parent_index(new_node_index)] = new_value
      new_node_index = parent_index(new_node_index)
      parent_value = @data[parent_index(new_node_index)]
    end
  end

  def down_heap(down_node_index = @head_index)
    down_value = @data[down_node_index]
    left_value = @data[left_index(down_node_index)]
    right_value = @data[right_index(down_node_index)]
    while true do
      if (left_value.nil? && right_value.nil?) ||
         (down_value < left_value && down_value < right_value)
        return
      end
      if left_value && down_value > left_value
        if right_value && down_value > right_value
          if left_value < right_value
            swap_left(down_node_index)
            down_node_index = left_index(down_node_index)
          else
            swap_right(down_node_index)
            down_node_index = right_index(down_node_index)
          end
        else
          swap_left(down_node_index)
          down_node_index = left_index(down_node_index)
        end
      elsif right_value && down_value > right_value
        swap_right(down_node_index)
        down_node_index = right_index(down_node_index)
      end
      left_value = @data[left_index(down_node_index)]
      right_value = @data[right_index(down_node_index)]
    end
  end

  def swap_left(idx)
    left_value = @data[left_index(idx)]
    @data[left_index(idx)] = @data[idx]
    @data[idx] = left_value
  end

  def swap_right(idx)
    right_value = @data[right_index(idx)]
    @data[right_index(idx)] = @data[idx]
    @data[idx] = right_value
  end

  def left_index(idx)
    idx * 2
  end

  def right_index(idx)
    left_index(idx) + 1
  end

  def parent_index(idx)
    (idx/2).floor
  end
end
