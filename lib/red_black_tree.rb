require_relative './tree'

class NilRedBlackNode < TreeNode
  attr_accessor :color

  def initialize
    @value = nil
    @color = "BLACK"
  end

  def self.instance
    @instance ||= NilRedBlackNode.new
  end
end

class RedBlackNode < TreeNode
  attr_accessor :color

  def initialize(val)
    super(val)
    @color = "RED"
    @left = NilRedBlackNode.instance
    @right = NilRedBlackNode.instance
  end
end

class RedBlackTree < Tree
  def insert(value)
    new_node = RedBlackNode.new(value)

    if @root.nil?
      @root = new_node
    else
      current_node = @root
      parent = current_node

      while current_node != NilRedBlackNode.instance do
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
    red_black_fixup(new_node)
  end

  def red_black_fixup(node)
    return unless node.color == "RED"
    parent = node.parent
    return node.color = "BLACK" if parent.nil? # new root of tree
    if parent.color == "RED"
      # we have a violation, need to figure out which one
      grandpa = parent.parent
      uncle = (grandpa.left == parent) ? grandpa.right : grandpa.left
      if uncle.color == "RED"
        # Hooray, this case is easy, pass down the blackness
        # from grandfather node, recolor grandpa to red,
        # and recursively fixup grandpa
        parent.color = "BLACK"
        uncle.color = "BLACK"
        grandpa.color = "RED"
        red_black_fixup(grandpa)
      else
        # dang, have to do some rotations...
        if node == parent.left && parent == grandpa.left
          rotate_right(parent, grandpa)
          # just using the pointers,
          # post rotation they aren't actually
          # related in this way
          parent.color = "BLACK"
          grandpa.color = "RED"
        elsif node == parent.right && parent == grandpa.right
          rotate_left(parent, grandpa)
          # just using the pointers,
          # post rotation they aren't actually
          # related in this way
          parent.color = "BLACK"
          grandpa.color = "RED"
        elsif node == parent.left && parent == grandpa.right
          rotate_right(node, parent)
          rotate_left(node, grandpa)
          node.color = "BLACK"
          grandpa.color = "RED"
        elsif node == parent.right && parent == grandpa.left
          rotate_left(node, parent)
          rotate_right(node, grandpa)
          node.color = "BLACK"
          grandpa.color = "RED"
        else
          puts "CURRENT NODE #{node.value} #{node.color}"
          puts "PARENT NODE #{parent.value} #{parent.color}"
          puts "GRANDPA NODE #{grandpa.value} #{grandpa.color}"
          raise "TREE STRUCTURE CORRUPTED, ABANDON HOPE"
        end
      end
    end
  end

  def rotate_right(node, parent)
    right_sub = node.right
    parent.left = right_sub
    right_sub.parent = parent

    grandparent = parent.parent
    node.parent = grandparent
    if grandparent
      if grandparent.left == parent
        grandparent.left = node
      else
        grandparent.right = node
      end
    end
    node.right = parent
    parent.parent = node

    @root = node if @root == parent
  end

  def rotate_left(node, parent)
    left_sub = node.left
    parent.right = left_sub
    left_sub.parent = parent

    grandparent = parent.parent
    node.parent = grandparent
    if grandparent
      if grandparent.left == parent
        grandparent.left = node
      else
        grandparent.right = node
      end
    end
    node.left = parent
    parent.parent = node

    @root = node if @root == parent
  end
end
