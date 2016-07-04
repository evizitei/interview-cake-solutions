require_relative "../lib/min_heap"

describe "MinHeap" do
  it "can insert and retrieve one value" do
    heap = MinHeap.new
    heap.insert(7)
    expect(heap.min).to eq(7)
  end

  it "balances as it inserts" do
    heap = MinHeap.new
    heap.insert(7)
    heap.insert(3)
    heap.insert(10)
    heap.insert(9)
    heap.insert(2)
    heap.insert(8)
    expect(heap.min).to eq(2)
  end

  it "can recalculate after extracting the min" do
    heap = MinHeap.new
    heap.insert(7)
    heap.insert(3)
    heap.insert(10)
    heap.insert(9)
    heap.insert(2)
    heap.insert(8)
    heap.extract_min
    heap.extract_min
    expect(heap.extract_min).to eq(7)
  end

  it "handles delete operation" do
    heap = MinHeap.new
    heap.insert(7)
    heap.insert(3)
    heap.insert(10)
    heap.insert(9)
    heap.insert(2)
    heap.insert(8)
    heap.delete(3)
    heap.extract_min
    expect(heap.min).to eq(7)
  end
end
