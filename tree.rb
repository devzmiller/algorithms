class BSTree
  attr_accessor :root
  def initialize(value)
    @root = Node.new(value)
  end

  def add_node(value)
    current = @root
    while current
      if current.value > value
        if current.left
          current = current.left
        else
          current.left = Node.new(value)
          current = nil
        end
      else
        if current.right
          current = current.right
        else
          current.right = Node.new(value)
          current = nil
        end
      end
    end
  end

  def add_nodes(nodes)
    nodes.each do |node|
      add_node(node)
    end
  end

  def df_traversal(current = @root)
    if current == nil
      return
    end
    df_traversal(current.left)
    p current.value
    df_traversal(current.right)
  end

  def bf_traversal
    queue = Queue.new
    queue.enq(@root)
    while !queue.empty?
      current = queue.deq
      p current.value
      if current.left
        queue.enq(current.left)
      end
      if current.right
        queue.enq(current.right)
      end
    end
  end

  def bf_array
    current_queue = Queue.new
    next_queue = Queue.new
    current_queue.enq(@root)
    arrays = []
    current_array = []
    while !current_queue.empty?
      current = current_queue.deq
      current_array << current.value
      if current.left
        next_queue.enq(current.left)
      end
      if current.right
        next_queue.enq(current.right)
      end
      if current_queue.empty?
        arrays << current_array
        current_array = []
        until next_queue.empty?
          current_queue.enq(next_queue.deq)
        end
      end
    end
    arrays
  end

  def is_BST(current = @root, min = -1000000000, max = 1000000000)
    if current == nil
      return true
    end
    if current.value < min || current.value > max
      return false
    end
    return is_BST(current.left, min, current.value) && is_BST(current.right, current.value, max)
  end
end

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

t = BSTree.new(6)
t.root.left = Node.new(3)
t.root.left.right = Node.new(7)
t.root.left.left = Node.new(1)
t.root.right = Node.new(10)
p t.is_BST
bst = BSTree.new(6)
t.root.left = Node.new(3)
t.root.left.right = Node.new(4)
t.root.left.left = Node.new(1)
t.root.right = Node.new(10)
p t.is_BST
