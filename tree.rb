class BSTree

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
    if current
      if !current.left && !current.right
        p current.value
      else
        df_traversal(current.left)
        p current.value
        df_traversal(current.right)
      end
    end
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
