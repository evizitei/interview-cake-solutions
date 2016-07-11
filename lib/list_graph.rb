class ListGraphNode
  attr_reader :value, :index

  def initialize(val, idx)
    @value = val
    @index = idx
  end
end

class ListGraph
  attr_reader :nodes

  def initialize
    @nodes = []
    @lookup = {}
    @adjacency_list = []
  end

  def insert_node(val)
    node = @lookup[val]
    if node.nil?
      node = ListGraphNode.new(val, @nodes.size)
      @nodes.push(node)
      @lookup[val] = node
    end
    return node
  end

  def insert_edge(val1, val2)
    node1 = insert_node(val1)
    node2 = insert_node(val2)

    update_adjacency_list(node1, node2)
    update_adjacency_list(node2, node1)
  end

  def connections(node)
    @adjacency_list[node.index]
  end

  def update_adjacency_list(n1, n2)
    index = n1.index
    edge_list = @adjacency_list[index]
    if edge_list.nil?
      edge_list = []
      @adjacency_list[index] = edge_list
    end
    edge = edge_list.find{|n| n == n2}
    if edge.nil?
      edge_list.push(n2)
    end
  end
end
