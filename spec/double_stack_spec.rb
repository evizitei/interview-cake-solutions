require_relative "../lib/double_stack"

describe "DoubleStack" do
  let(:stack){ DoubleStack.new }

  it "can push/pop" do
    stack.push_one(12)
    stack.push_two(21)
    expect(stack.pop_one).to eq(12)
    expect(stack.pop_two).to eq(21)
  end

  it "underflows if popped without values" do
    expect{ stack.pop_one }.to raise_error
    expect{ stack.pop_two }.to raise_error
  end

  it "overflows if pushed past size limit" do
    stack = DoubleStack.new(5)
    stack.push_one(1)
    stack.push_two(2)
    stack.push_one(3)
    stack.push_two(4)
    stack.push_one(5)
    expect{ stack.push_two(6) }.to raise_error
    expect{ stack.push_one(6) }.to raise_error
  end

  it "can push pop many times in a row" do
    (1..5).to_a.each do |i|
      stack.push_one(i)
    end
    (1..5).to_a.each do |i|
      stack.push_two(i)
    end
    (1..5).to_a.reverse.each do |i|
      expect(stack.pop_one).to eq(i)
    end
    (1..5).to_a.reverse.each do |i|
      expect(stack.pop_two).to eq(i)
    end
  end

  it "knows if it's empty" do
    expect(stack.is_empty?).to be_truthy
    stack.push_one(10)
    expect(stack.is_empty?).to be_falsey
  end
end
