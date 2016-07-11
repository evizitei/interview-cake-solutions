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
    node = lookup(val)
    if node.nil?
      idx = @matrix.size
      node = MatrixGraphNode.new(val, idx)
      @nodes.push(node)
      @matrix[idx] = []
    end
    return node
  end

  def lookup(val)
    @nodes.find{|n| n.value == val}
  end

  def insert_edge(val1, val2)
    node1 = insert_node(val1)
    node2 = insert_node(val2)
    @matrix[node1.index][node2.index] = true
    @matrix[node2.index][node1.index] = true
  end

  def shortest_path(val1, val2)
    start = lookup(val1)
    return nil unless start

    color = Array.new(@matrix.size){ "white" }
    previous = Array.new(@matrix.size)

    queue = []
    queue.push(start)

    node = nil

    while queue.size > 0 do
      node = queue.shift
      color[node.index] = "black"
      if node.value == val2
        queue = []
      else
        @matrix[node.index].each_with_index do |value, idx|
          if value
            target = @nodes[idx]
            if color[target.index] == "white"
              color[target.index] = "grey"
              previous[target.index] = node
              queue.push(target)
            end
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
