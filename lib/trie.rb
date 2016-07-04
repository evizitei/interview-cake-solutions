
class Trie

  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    key = word.downcase
    current_node = @root
    for i in (0..key.length - 1) do
      char = key[i]
      current_node = current_node.get_or_make_child(char)
    end
    current_node.terminates = true
  end

  def search(word)
    key = word.downcase
    current_node = @root
    for i in (0..key.length - 1) do
      char = key[i]
      current_node = current_node.get_child(char)
      return false if current_node.nil?
    end
    return current_node.terminates
  end
end

class TrieNode
  INDEXER = "abcdefghijklmnopqrstuvwxyz".freeze
  attr_accessor :terminates

  def initialize
    @children = []
    @terminates = false
  end

  def get_or_make_child(char)
    node = get_child(char)
    if node.nil?
      node = TrieNode.new
      @children[INDEXER.index(char)] = node
    end
    node
  end

  def get_child(char)
    index = INDEXER.index(char)
    @children[index]
  end

end
