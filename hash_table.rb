class HashTable
  attr_accessor :array

  def initialize
    @array = Array.new(2069) { Array.new }
  end

  def hash(key)
    index_val = 0
    key.split("").each_with_index do |char, index|
      index_val += char.ord * index
    end
    p index_val % @array.length
  end

  def push(key, value)
    index = hash(key)
    @array[index] << DataItem.new(key, value)
  end

  def get(key)
    index = hash(key)
    @array[index].each do |item|
      return item.value if item.key == key
    end
    nil
  end

end

class DataItem
  attr_accessor :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end
