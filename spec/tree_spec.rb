require_relative "../lib/tree"

def build_tree
  leaf1 = TreeNode.new(1)
  leaf2 = TreeNode.new(4)
  leaf3 = TreeNode.new(6)
  leaf4 = TreeNode.new(8)
  leaf5 = TreeNode.new(10)
  node1 = TreeNode.new(2)
  node2 = TreeNode.new(3)
  node3 = TreeNode.new(7)
  node4 = TreeNode.new(9)
  root = TreeNode.new(5)
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

describe "Tree" do
  it "traverses nodes in sorted order" do
    root = build_tree
    keys = Tree.go!(root)
    expect(keys.length).to eq(10)
    for i in (1..keys.length - 1) do
      expect(keys[i] > keys[i-1]).to be_truthy
    end
  end

  it "does the same iteratively" do
    root = build_tree
    keys = Tree.go_iteratively!(root)
    expect(keys.length).to eq(10)
    for i in (1..keys.length - 1) do
      expect(keys[i] > keys[i-1]).to be_truthy
    end
  end

  describe "instance methods" do
    let(:tree){ Tree.new(build_tree) }

    describe "search" do
      it "returns a matching node if it exists" do
        expect(tree.search(4).value).to eq(4)
      end

      it "returns nil if no match exists" do
        expect(tree.search(11)).to be_nil
      end
    end

    describe "search_iteratively" do
      it "returns a matching node if it exists" do
        expect(tree.search_iteratively(4).value).to eq(4)
      end

      it "returns nil if no match exists" do
        expect(tree.search_iteratively(11)).to be_nil
      end
    end

    it "can return min" do
      expect(tree.min).to eq(1)
    end

    it "can find max" do
      expect(tree.max).to eq(10)
    end
  end
end
