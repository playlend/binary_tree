class Node
  attr_accessor :value, :left, :right, :parent
  @@count = 0
  @@instances = []
  def initialize(value, parent = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
    @parent = parent
    @@count += 1
    @@instances << self
  end

  def insert_node(root,value)
    if value < root.value
      if root.left == nil
        root.left = Node.new(value, root)
      else
        insert_node(root.left, value)
      end
    elsif value > root.value
      if root.right == nil
        root.right = Node.new(value,root)
      else
        insert_node(root.right,value)
      end
    end
  end

 

  def self.all
    p @@instances
  end

end

 def build_tree(arr)
    root = Node.new(arr[0])
    arr.each { |val| root.insert_node(root,val) }
    return root
end

def bfs(value, tree)
  queue = []
  queue << tree
  target = nil

  until queue.empty? || target
    currentNode = queue.shift
    if currentNode.value == value
      target = currentNode
    else
      if currentNode.left != nil
        queue << currentNode.left
      end
      if currentNode.right != nil
        queue <<currentNode.right
      end
    end 
   end
   target  
end

def dfs(value, tree)
  stack = []
  stack << tree
  target = nil

  until stack.empty? || target
      currentNode = stack.pop
      if currentNode.value == value
        target == currentNode
      else
        if currentNode.right != nil
          stack << currentNode.right
        end
        if currentNode.left !=nil
          stack << currentNode.left
        end
      end
  end
  target
end

def dfs_rec(value, node)
  target = nil
  if node.value == value
    target = node
  end

  if target == nil
    if node.left != nil
      target = dfs_rec(value, node.left)
    end

    if target == nil
      if node.right != nil
        target = dfs_rec(value, node.right)
      end
    end

  end
  target
end

arr = [10,6,8,3,4,12]
tree = build_tree(arr)
#puts Node.all

#puts bfs(6,tree)

