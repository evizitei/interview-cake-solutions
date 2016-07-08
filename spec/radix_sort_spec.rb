require_relative "../lib/radix_sort"

describe "RadixSort" do
  it "sorts a small array" do
    input = [196,327,485,123,456,789,602,134,613,201]
    output = RadixSort.go!(input)
    expect(output).to eq([123,134,196,201,327,456,485,602,613,789])
  end

  it "sorts a sorted array" do
    input = [123,134,196,201,327,456,485,602,613,789]
    output = RadixSort.go!(input)
    expect(output).to eq([123,134,196,201,327,456,485,602,613,789])
  end

  it "sorts a reverse sorted array" do
    input = [789,613,602,485,456,327,201,196,134,123]
    output = RadixSort.go!(input)
    expect(output).to eq([123,134,196,201,327,456,485,602,613,789])
  end

  it "sorts an array with repeat values" do
    input = [196,327,485,123,456,789,602,134,613,201,485,196,602]
    output = RadixSort.go!(input)
    expect(output).to eq([123,134,196,196,201,327,456,485,485,602,602,613,789])
  end

end
