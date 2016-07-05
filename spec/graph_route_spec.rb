require_relative "../lib/graph_route"

describe GraphRoute do
  let(:graph){ Graph.new }
  before(:each) do
    @anode = GraphNode.new("a")
    graph.insert(@anode)
    @bnode = GraphNode.new("b")
    graph.insert(@bnode)
    @cnode = GraphNode.new("c")
    graph.insert(@cnode)
    @dnode = GraphNode.new("d")
    graph.insert(@dnode)
    @enode = GraphNode.new("e")
    graph.insert(@enode)
    @fnode = GraphNode.new("f")
    graph.insert(@fnode)
    @gnode = GraphNode.new("g")
    graph.insert(@gnode)
    @anode.make_edge(@bnode)
    @anode.make_edge(@enode)
    @bnode.make_edge(@cnode)
    @cnode.make_edge(@dnode)
    @cnode.make_edge(@gnode)
    @dnode.make_edge(@enode)
    @dnode.make_edge(@bnode)
    @enode.make_edge(@fnode)
    @fnode.make_edge(@gnode)
  end

  it "returns true for traversable nodes" do
    route = GraphRoute.new(graph)
    route.exists_for(@bnode, @enode)
  end

  it "returns false for wrong direction traversal" do
    route = GraphRoute.new(graph)
    route.exists_for(@bnode, @anode)
  end
end
