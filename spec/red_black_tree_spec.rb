require_relative "../lib/red_black_tree"

def build_tree
  tree = RedBlackTree.new
  tree.insert(1)
  tree.insert(2)
  tree.insert(3)
  tree.insert(4)
  tree.insert(5)
  tree.insert(6)
  tree.insert(7)
  tree.insert(8)
  tree.insert(9)
  tree.insert(10)
  return tree
end

describe "RedBlackTree" do
  it "rebalances with insertion" do
    tree = build_tree
    puts "#{tree.root.value}"
    puts "#{tree.root.left.value}"
    puts "#{tree.root.left.left.value}"
    puts "#{tree.root.left.right.value}"
    puts "#{tree.root.right.value}"
    expect(tree.root.value).to eq(5)
  end

end
