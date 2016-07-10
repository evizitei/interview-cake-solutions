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

  it "keeps the root black" do
    tree = RedBlackTree.new
    expect(tree.root).to be_nil
    tree.insert(5)
    expect(tree.root.value).to eq(5)
    expect(tree.root.color).to eq("BLACK")
  end

  it "doesn't rebalance when unnecessary" do
    tree = RedBlackTree.new
    expect(tree.root).to be_nil
    tree.insert(1)
    tree.insert(2)
    root = tree.root
    expect(root.value).to eq(1)
    expect(root.color).to eq("BLACK")
    right = root.right
    expect(right.value).to eq(2)
    expect(right.color).to eq("RED")
  end

  it "reblances a small tree" do
    tree = RedBlackTree.new
    expect(tree.root).to be_nil
    tree.insert(1)
    tree.insert(2)
    tree.insert(3)
    root = tree.root
    expect(root.value).to eq(2)
    expect(root.color).to eq("BLACK")
    right = root.right
    expect(right.value).to eq(3)
    expect(right.color).to eq("RED")
    left = root.left
    expect(left.value).to eq(1)
    expect(left.color).to eq("RED")
  end

  it "rebalances in the re-color case" do
    tree = RedBlackTree.new
    expect(tree.root).to be_nil
    tree.insert(2) # black root
    tree.insert(1) # red node
    tree.insert(3) # red node
    tree.insert(4) # red node with red uncle
    root = tree.root
    expect(root.value).to eq(2)
    expect(root.color).to eq("BLACK")
    right = root.right
    expect(right.value).to eq(3)
    expect(right.color).to eq("BLACK")
    left = root.left
    expect(left.value).to eq(1)
    expect(left.color).to eq("BLACK")
    right_again = right.right
    expect(right_again.value).to eq(4)
    expect(right_again.color).to eq("RED")
  end

  it "rebalances after multiple bad inserts" do
    tree = RedBlackTree.new
    expect(tree.root).to be_nil
    tree.insert(1)
    tree.insert(2)
    tree.insert(3)
    tree.insert(4)

    root = tree.root
    expect(root.value).to eq(2)
    expect(root.color).to eq("BLACK")
    right = root.right
    expect(right.value).to eq(3)
    expect(right.color).to eq("BLACK")
    left = root.left
    expect(left.value).to eq(1)
    expect(left.color).to eq("BLACK")
    sub_right = right.right
    expect(sub_right.value).to eq(4)
    expect(sub_right.color).to eq("RED")
  end

  it "can rebalance up through 5" do
    tree = RedBlackTree.new
    expect(tree.root).to be_nil
    tree.insert(1)
    tree.insert(2)
    tree.insert(3)
    tree.insert(4)
    tree.insert(5)

    root = tree.root
    expect(root.value).to eq(2)
    expect(root.color).to eq("BLACK")
    right = root.right
    expect(right.value).to eq(4)
    expect(right.color).to eq("BLACK")
    left = root.left
    expect(left.value).to eq(1)
    expect(left.color).to eq("BLACK")
    sub_right = right.right
    expect(sub_right.value).to eq(5)
    expect(sub_right.color).to eq("RED")
    sub_left = right.left
    expect(sub_left.value).to eq(3)
    expect(sub_left.color).to eq("RED")
  end


  it "rebalances with worst case insertion" do
    tree = build_tree
    expect(tree.root.value).to eq(4)
  end

end
