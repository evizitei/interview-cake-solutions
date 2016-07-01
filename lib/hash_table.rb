class HashTable
  HASH_TABLE_SIZE = 701
  def initialize
    @store = Array.new(HASH_TABLE_SIZE)
  end

  def set(key, value)
    hash_key = hash(key)
    node = HashNode.new(key, value)
    if @store[hash_key]
      c_node = @store[hash_key]
      while c_node != nil do
        if c_node.k == key
          c_node.v = value
          return
        end
      end
      node.next = @store[hash_key]
    end
    @store[hash_key] = node
  end

  def get(key)
    hash_key = hash(key)
    head = @store[hash_key]
    return nil unless head
    node = head
    while node != nil do
      if node.k == key
        return node.v
      end
      node = node.next
    end
    return nil
  end

  def delete(key)
    hash_key = hash(key)
    head = @store[hash_key]
    if head.k == key
      @store[hash_key] = head.next
      return
    end
    node = head
    while node.next != nil do
      if node.next.k == key
        node.next = node.next.next
        return
      end
    end
  end

  private
  def hash(key)
    values = []
    (0...key.length).each do |i|
      values << key[i].ord
    end
    return values.join("").to_i % HASH_TABLE_SIZE
  end
end

class HashNode
  attr_accessor :k,:v,:next

  def initialize(key, value)
    @k = key
    @v = value
  end
end
