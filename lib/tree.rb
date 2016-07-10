class TreeNode
  attr_accessor :left, :right, :value, :parent

  def initialize(val)
    @value = val
  end
end

class Tree
  attr_reader :root

  def initialize(root=nil)
    @root = root
  end

  def insert(value)
    new_node = value.is_a?(TreeNode) ? value : TreeNode.new(value)

    if @root.nil?
      @root = new_node
    else
      current_node = @root
      parent = current_node

      while !current_node.nil? do
        parent = current_node
        if current_node.value > value
          current_node = current_node.left
        else
          current_node = current_node.right
        end
      end

      new_node.parent = parent
      if parent.value > value
        parent.left = new_node
      else
        parent.right = new_node
      end
    end
  end

  def delete(node)
    if node.left.nil? && node.right.nil?
      parent = node.parent
      if parent.left == node
        parent.left = nil
      else
        parent.right = nil
      end
      node.parent = nil
    else
      if node.left.nil?
        splice_out(node, node.right)
      elsif node.right.nil?
        splice_out(node, node.left)
      else
        # node has 2 children
        node_next = successor(node)
        splice_out(node, node_next)
      end
    end
  end

  def splice_out(node, child)
    parent = node.parent
    child.parent = parent
    if parent.left == node
      parent.left = node.right
    else
      parent.right = node.right
    end
    node.right = nil
    node.parent = nil
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
      return search(min(node))
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
      return search(max(node))
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
