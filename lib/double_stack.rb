# implement 2 stacks on one array of size n such that
# neither stack overflows unless the total number
# of elements in both stacks together is n.  Each operation should
# run in O(n)

class DoubleStack
  def initialize(size = 1000)
    @size = size
    @store = Array.new(size)
    @top1 = 0
    @top2 = @size - 1
  end

  def is_empty?
    @top1 == 0 && @top2 == @size - 1
  end

  def push_one(value)
    raise "stack overflow" if @top1 > @top2
    @store[@top1] = value
    @top1 += 1
  end

  def push_two(value)
    raise "stack overflow" if @top1 > @top2
    @store[@top2] = value
    @top2 -= 1
  end

  def pop_one
    raise "stack one underflow" if @top1 <= 0
    @top1 -= 1
    @store[@top1]
  end

  def pop_two
    raise "stack two underflow" if @top2 >= @size - 1
    @top2 += 1
    @store[@top2]
  end
end
