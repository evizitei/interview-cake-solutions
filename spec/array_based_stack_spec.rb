require_relative "../lib/array_based_stack"

describe "ArrayBasedStack" do
  let(:stack){ ArrayBasedStack.new }

  it "can push/pop" do
    stack.push(12)
    expect(stack.pop).to eq(12)
  end

  it "underflows if popped without values" do
    expect{ stack.pop }.to raise_error
  end

  it "overflows if pushed past size limit" do
    stack = ArrayBasedStack.new(5)
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    stack.push(5)
    expect{ stack.push(6) }.to raise_error
  end

  it "can push pop many times in a row" do
    (1..5).to_a.each do |i|
      stack.push(i)
    end
    (1..5).to_a.reverse.each do |i|
      expect(stack.pop).to eq(i)
    end
  end

  it "knows if it's empty" do
    expect(stack.is_empty?).to be_truthy
    stack.push(10)
    expect(stack.is_empty?).to be_falsey
  end
end
