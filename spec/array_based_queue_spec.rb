require_relative "../lib/array_based_queue"

describe "ArrayBasedQueue" do
  let(:queue){ ArrayBasedQueue.new }

  it "can enqueue/dequeue" do
    queue.enqueue(12)
    expect(queue.dequeue).to eq(12)
  end

  it "underflows if dequeueped without values" do
    expect{ queue.dequeue }.to raise_error
  end

  it "overflows if enqueueed past size limit" do
    queue = ArrayBasedQueue.new(5)
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    queue.enqueue(4)
    queue.enqueue(5)
    expect{ queue.enqueue(6) }.to raise_error
  end

  it "can enqueue dequeue many times in a row" do
    (1..5).to_a.each do |i|
      queue.enqueue(i)
    end
    (1..5).to_a.each do |i|
      expect(queue.dequeue).to eq(i)
    end
  end

  it "knows if it's empty" do
    expect(queue.is_empty?).to be_truthy
    queue.enqueue(10)
    expect(queue.is_empty?).to be_falsey
  end
end
