require_relative "../lib/matrix_graph"

describe "MatrixGraph" do
  let(:graph){ MatrixGraph.new }

  describe "insert_node" do
    it "creates a new node for the value" do
      expect(graph.nodes.size).to eq(0)
      graph.insert_node(12)
      node = graph.nodes.first
      expect(node.value).to eq(12)
    end

    it "returns the inserted node" do
      node = graph.insert_node(6)
      expect(node.value).to eq(6)
    end

    it "doesn't insert the same node twice" do
      node = graph.insert_node(7)
      node2 = graph.insert_node(7)
      node3 = graph.insert_node(7)
      node4 = graph.insert_node(7)
      expect(node).to eq(node2)
      expect(node3).to eq(node4)
      expect(graph.nodes.size).to eq(1)
    end
  end

  describe "insert_edge" do
    it "can create an edge between existing nodes" do
      expect(graph.nodes.size).to eq(0)
      graph.insert_node(12)
      graph.insert_node(7)
      graph.insert_edge(7, 12)
      node = graph.nodes.find{|n| n.value == 7}
      expect(graph.connections(node).first.value).to eq(12)
    end

    it "wont duplicate existing edges" do
      expect(graph.nodes.size).to eq(0)
      graph.insert_edge(7, 12)
      graph.insert_edge(7, 12)
      graph.insert_edge(7, 12)
      expect(graph.nodes.size).to eq(2)
      node = graph.nodes.find{|n| n.value == 7}
      expect(graph.connections(node).size).to eq(1)
    end
  end
end
