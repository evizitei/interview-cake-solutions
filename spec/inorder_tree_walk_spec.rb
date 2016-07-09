require_relative "../lib/inorder_tree_walk"

def build_tree
  leaf1 = BstNode.new(1)
  leaf2 = BstNode.new(4)
  leaf3 = BstNode.new(6)
  leaf4 = BstNode.new(8)
  leaf5 = BstNode.new(10)
  node1 = BstNode.new(2)
  node2 = BstNode.new(3)
  node3 = BstNode.new(7)
  node4 = BstNode.new(9)
  root = BstNode.new(5)
  root.left = node2
  root.right = node3
  node2.left = node1
  node2.right = leaf2
  node3.left = leaf3
  node3.right = node4
  node1.left = leaf1
  node4.left = leaf4
  node4.right = leaf5
  return root
end

describe "InorderTreeWalk" do
  it "traverses nodes in sorted order" do
    root = build_tree
    keys = InorderTreeWalk.go!(root)
    expect(keys.length).to eq(10)
    for i in (1..keys.length - 1) do
      expect(keys[i] > keys[i-1]).to be_truthy
    end
  end

  it "does the same iteratively" do
    root = build_tree
    keys = InorderTreeWalk.go_iteratively!(root)
    expect(keys.length).to eq(10)
    for i in (1..keys.length - 1) do
      expect(keys[i] > keys[i-1]).to be_truthy
    end
  end
end
