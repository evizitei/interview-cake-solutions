class ArrayBasedStack
  def initialize(size = 1000)
    @size = size
    @top_index = 0
    @store = Array.new(@size)
  end

  def is_empty?
    return @top_index == 0
  end

  def push(value)
    raise "stack overflow" if @top_index == @size
    @store[@top_index] = value
    @top_index += 1
  end

  def pop
    raise "stack underflow" if is_empty?
    @top_index -= 1
    @store[@top_index]
  end
end
