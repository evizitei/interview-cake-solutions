require_relative "../lib/trie"

describe "Trie" do
  it "can insert and retrieve one value" do
    trie = Trie.new
    trie.insert("dog")
    expect(trie.search("dog")).to be_truthy
    expect(trie.search("cat")).to be_falsey
  end

  it "can handle many words with the same stem" do
    trie = Trie.new
    trie.insert("can")
    trie.insert("cannon")
    trie.insert("cant")
    trie.insert("cantilever")
    trie.insert("cantalope")
    expect(trie.search("cannon")).to be_truthy
    expect(trie.search("canno")).to be_falsey
    expect(trie.search("cantalope")).to be_truthy
  end

end
