class TreeNode
  attr_accessor :left, :right, :value
  def initialize(val)
    @value = val
  end
end

class Tree
  def initialize(root)
    @root = root
  end

  def search(value, node=@root)
    return nil if node.nil?
    return node if node.value == value
    if node.value > value
      return search(value, node.left)
    else
      return search(value, node.right)
    end
  end

  # in order traversals
  def self.go_iteratively!(root)
    stack = []
    keys = []
    current_node = root
    just_popped = false
    while !current_node.nil? do
      if !just_popped && current_node.left
        stack.push(current_node)
        just_popped = false
        current_node = current_node.left
      else
        keys.push(current_node.value)
        if current_node.right
          current_node = current_node.right
          just_popped = false
        else
          current_node = stack.pop
          just_popped = true
        end
      end
    end

    return keys
  end

  def self.go!(root)
    keys = []
    fetch_ordered_keys_recursively(root, keys)
  end

  def self.fetch_ordered_keys_recursively(node, keys)
    return keys if node.nil?
    keys = fetch_ordered_keys_recursively(node.left, keys)
    keys.push(node.value)
    keys = fetch_ordered_keys_recursively(node.right, keys)
    return keys
  end
end
