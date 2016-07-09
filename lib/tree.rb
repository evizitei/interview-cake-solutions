class TreeNode
  attr_accessor :left, :right, :value, :parent

  def initialize(val)
    @value = val
  end
end

class Tree
  def initialize(root)
    @root = root
  end

  def min(cur_node=@root)
    while !cur_node.left.nil?
      cur_node = cur_node.left
    end
    return cur_node.value
  end

  def max(cur_node=@root)
    while !cur_node.right.nil?
      cur_node = cur_node.right
    end
    return cur_node.value
  end

  def successor(node)
    if node.right
      return min(node)
    else
      next_node = node.parent
      while !next_node.nil? && next_node.right == node do
        node = next_node
        next_node = node.parent
      end
      return next_node
    end
  end

  def predecessor(node)
    if node.left
      return max(node)
    else
      prev_node = node.parent
      while !prev_node.nil? && prev_node.left == node do
        node = prev_node
        prev_node = node.parent
      end
      return prev_node
    end
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

  def search_iteratively(value)
    current_node = @root
    while !current_node.nil? do
      if current_node.value == value
        return current_node
      end
      if current_node.value > value
        current_node = current_node.left
      else
        current_node = current_node.right
      end
    end
    return nil
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
