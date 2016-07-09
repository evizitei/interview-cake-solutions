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
  node2.parent = root
  node3.parent = root

  node2.left = node1
  node2.right = leaf2
  node1.parent = node2
  leaf2.parent = node2

  node3.left = leaf3
  node3.right = node4
  leaf3.parent = node3
  node4.parent = node3

  node1.left = leaf1
  leaf1.parent = node1

  node4.left = leaf4
  node4.right = leaf5
  leaf4.parent = node4
  leaf5.parent = node4

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

    describe "#successor" do
      it "returns next node if there is one" do
        node = tree.search(6)
        expect(tree.successor(node).value).to eq(7)
      end

      it "returns nil for end of iteration" do
        node = tree.search(10)
        expect(tree.successor(node)).to be_nil
      end
    end

    describe "#predecessor" do
      it "returns previous node if there is one" do
        node = tree.search(6)
        expect(tree.predecessor(node).value).to eq(5)
      end

      it "returns nil for beginning of iteration" do
        node = tree.search(1)
        expect(tree.predecessor(node)).to be_nil
      end
    end
  end

  describe "tree modulation" do
    it "can insert nodes" do
      tree = Tree.new
      tree.insert(3)
      tree.insert(5)
      tree.insert(1)
      expect(tree.min).to eq(1)
      expect(tree.max).to eq(5)
    end

    describe "node deletion" do
      let(:tree){ Tree.new }

      before(:each) do
        tree.insert(5)

        tree.insert(2)
        tree.insert(1)
        tree.insert(3)

        tree.insert(7)
        tree.insert(6)
        tree.insert(8)

        tree.insert(9)
      end

      it "can delete a leaf" do
        leaf = tree.search(1)
        tree.delete(leaf)
        expect(tree.search(1)).to be_nil
      end

      it "can delete a single child node" do
        node = tree.search(8)
        tree.delete(node)
        expect(tree.search(8)).to be_nil
        leaf = tree.search(9)
        expect(leaf.parent.value).to eq(7)
      end

      it "can delete a full mid-tier node" do
        node = tree.search(7)
        tree.delete(node)
        expect(tree.search(7)).to be_nil
        node = tree.search(5)
        expect(node.right.value).to eq(8)
      end
    end
  end
end
