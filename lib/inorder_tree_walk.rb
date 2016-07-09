class BstNode
  attr_accessor :left, :right, :value
  def initialize(val)
    @value = val
  end
end

class InorderTreeWalk
  def self.go!(root)
    keys = []
    fetch_ordered_keys(root, keys)
  end

  def self.fetch_ordered_keys(node, keys)
    return keys if node.nil?
    keys = fetch_ordered_keys(node.left, keys)
    keys.push(node.value)
    keys = fetch_ordered_keys(node.right, keys)
    return keys
  end
end
