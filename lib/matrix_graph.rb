class MatrixGraphNode
  attr_reader :value, :index
  def initialize(val,idx)
    @value = val
    @index = idx
  end
end

class MatrixGraph
  attr_reader :nodes

  def initialize
    @nodes = []
    @matrix = []
  end

  def insert_node(val)
    node = @nodes.find{|n| n.value == val}
    if node.nil?
      idx = @matrix.size
      node = MatrixGraphNode.new(val, idx)
      @nodes.push(node)
      @matrix[idx] = []
    end
    return node
  end

  def insert_edge(val1, val2)
    node1 = insert_node(val1)
    node2 = insert_node(val2)
    @matrix[node1.index][node2.index] = true
    @matrix[node2.index][node1.index] = true
  end

  def connections(node)
    edges = @matrix[node.index]
    conns = []
    edges.each_with_index do |connected, index|
      if connected
        conns.push(@nodes[index])
      end
    end
    return conns
  end
end
