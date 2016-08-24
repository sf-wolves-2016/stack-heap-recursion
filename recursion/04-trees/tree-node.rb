class TreeNode
  attr_accessor :left, :right, :value
  def initialize(value, left = nil, right = nil)
    @value = value
    @right = right
    @left = left
  end
end


root = TreeNode.new(12, TreeNode.new(9), TreeNode.new(13, TreeNode.new(11)))

def depth(tree_node)
  return 0 if !tree_node
  [depth(tree_node.left), depth(tree_node.right)].max + 1
end

p depth(root)

