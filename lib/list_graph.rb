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

  def shortest_path(val1, val2)
    start = @lookup[val1]
    return nil unless start
    color = Array.new(@adjacency_list.length){ "white" }
    previous = Array.new(@adjacency_list.length)
    queue = []
    queue.push(start)

    node = nil
    while queue.size > 0 do
      node = queue.shift
      color[node.index] = "black"
      if node.value == val2
        queue = []
      else
        edges = @adjacency_list[node.index]
        edges.each do |edge_node|
          if color[edge_node.index] == "white"
            color[edge_node.index] = "grey"
            previous[edge_node.index] = node
            queue.push(edge_node)
          end
        end
      end
    end

    return nil unless node.value == val2

    chain = [node]
    while previous[node.index] != nil do
      node = previous[node.index]
      chain.unshift(node)
    end

    return chain
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
