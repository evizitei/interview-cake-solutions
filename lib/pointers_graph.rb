class PointersGraphNode
  attr_reader :value, :edges

  def initialize(val)
    @value = val
    @edges = []
  end

  def connect(edge)
    edges.push(edge)
  end

  def connect_to(node)
    edge = @edges.find{|e| e.node_one == node || e.node_two == node }
    if edge.nil?
      edge = PointersGraphEdge.new(self, node)
      @edges.push(edge)
      self.connect(edge)
      node.connect(edge)
    end
    return edge
  end
end

class PointersGraphEdge
  attr_reader :node_one, :node_two

  def initialize(n1, n2)
    @node_one = n1
    @node_two = n2
  end
end

class PointersGraph
  attr_reader :nodes, :edges

  def initialize
    @nodes = []
    @edges = []
    @lookup = {}
  end

  def insert_node(val)
    node = @lookup[val]
    if node.nil?
      node = PointersGraphNode.new(val)
      @lookup[val] = node
      @nodes.push(node)
    end

    return node
  end

  def insert_edge(val1, val2)
    node1 = insert_node(val1)
    node2 = insert_node(val2)
    edge = node1.connect_to(node2)
    @edges.push(edge) unless @edges.find{|e| e == edge}
    return edge
  end
end
