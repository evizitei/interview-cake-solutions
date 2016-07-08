class ArrayBasedQueue
  def initialize(size = 1000)
    @size = size + 1
    @store = Array.new(@size)
    @head = 1
    @tail = 1
  end

  def is_empty?
    @head == @tail
  end

  def enqueue(value)
    raise "queue overflow" if @tail + 1 == @head
    @store[@tail] = value
    @tail += 1
    @tail = 0 if @tail >= @size
  end

  def dequeue
    raise "queue underflow" if is_empty?
    value = @store[@head]
    @head += 1
    @head = 0 if @head >= @size
    return value
  end
end
