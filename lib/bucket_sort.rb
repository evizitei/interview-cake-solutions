class BucketSort
  BUCKET_COUNT = 10
  def self.go!(input, min=nil, max=nil)
    if min.nil? || max.nil?
      min, max = min_max(input)
    end

    buckets = Array.new(BUCKET_COUNT){ [] }
    input.each do |value|
      sortable_index = ((value - min).to_f/(max - min).to_f * (BUCKET_COUNT - 1))
      buckets[sortable_index].push(value)
    end

    output = []
    buckets.each do |bucket|
      if bucket.length > 0
        sorted_bucket = insertion_sort(bucket)
        sorted_bucket.each{|val| output.push(val) }
      end
    end
    return output
  end

  def self.insertion_sort(list)
    for i in (0..list.length - 1) do
      value = list[i]
      j = i - 1
      while j >= 0 && value < list[j] do
        list[j+1] = list[j]
        j -= 1
      end
      list[j + 1] = value
    end
    return list
  end

  def self.min_max(input)
    min = input.first
    max = 0
    input.each do |i|
      min = i if i < min
      max = i if i > max
    end
    return min, max
  end
end
