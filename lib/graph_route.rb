class GraphRoute
  def initialize(graph)
    @graph = graph
  end

  def exists_for(a, b)
    @graph.nodes.each{|n| n.visited = false }
    to_visit = [a]
    while !to_visit.empty? do
      current_node = to_visit.shift
      if !current_node.visited
        return true if current_node.value == b.value
        current_node.adjacent.each do |node|
          to_visit.push(node)
        end
        current_node.visited = true
      end
    end
    return false
  end
end

class Graph
  attr_reader :nodes
  def initialize
    @nodes = []
  end

  def insert(node)
    @nodes << node
  end
end

class GraphNode
  attr_reader :value
  attr_accessor :visited
  attr_reader :adjacent

  def initialize(val)
    @value = val
    @adjacent = []
    @visited = false
  end

  def make_edge(node)
    @adjacent << node
  end
end
