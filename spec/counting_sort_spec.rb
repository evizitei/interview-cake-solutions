require_relative "../lib/counting_sort"

describe "CountingSort" do
  it "sorts a small array" do
    input = [1,9,6,3,2,7,4,8,5]
    output = CountingSort.go!(input)
    expect(output).to eq([1,2,3,4,5,6,7,8,9])
  end

  it "sorts a sorted array" do
    input = [1,2,3,4,5,6,7,8]
    output = CountingSort.go!(input)
    expect(output).to eq([1,2,3,4,5,6,7,8])
  end

  it "sorts a reverse sorted array" do
    input = [10,9,8,7,6,5,4,3,2,1]
    output = CountingSort.go!(input)
    expect(output).to eq([1,2,3,4,5,6,7,8,9,10])
  end

  it "sorts an array with repeat values" do
    input = [6,0,2,0,1,3,4,6,1,3,2]
    output = CountingSort.go!(input)
    expect(output).to eq([0,0,1,1,2,2,3,3,4,6,6])
  end

end
