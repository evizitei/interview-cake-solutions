require_relative "../lib/hash_table"

describe "HashTable" do
  it "can insert and retrieve" do
    ht = HashTable.new
    ht.set("apple", "banana")
    expect(ht.get("apple")).to eq("banana")
  end

  it "can store many values" do
    ht = HashTable.new
    ht.set("a", "b")
    ht.set("c", "d")
    ht.set("e", "f")
    ht.set("g", "h")
    ht.set("i", "j")
    ht.set("k", "l")
    expect(ht.get("g")).to eq("h")
  end

  it "can delete values" do
    ht = HashTable.new
    ht.set("a", "b")
    ht.set("a", "c")
    ht.set("a", "d")
    ht.delete("a")
    expect(ht.get("a")).to be_nil
  end
end
