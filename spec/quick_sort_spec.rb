require_relative "../lib/quick_sort"

describe "QuickSort" do
  it "sorts a small array" do
    input = [1,9,6,3,2,7,4,8,5]
    output = QuickSort.go!(input)
    expect(output).to eq([1,2,3,4,5,6,7,8,9])
  end

  it "sorts a sorted array" do
    input = [1,2,3,4,5,6,7,8]
    output = QuickSort.go!(input)
    expect(output).to eq([1,2,3,4,5,6,7,8])
  end

  it "sorts a reverse sorted array" do
    input = [10,9,8,7,6,5,4,3,2,1]
    output = QuickSort.go!(input)
    expect(output).to eq([1,2,3,4,5,6,7,8,9,10])
  end
end
