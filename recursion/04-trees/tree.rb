require_relative 'tree-node'
require 'pry'
class Tree
  attr_accessor :root
  def initialize(args = {})
    @root = args.fetch(:root) do
      self.class.build_random_tree(args.fetch(:depth, 3))
    end
  end

  def self.build_random_tree(depth)
    return TreeNode.new(rand(0..50)) if depth == 1
    left = self.build_random_tree(depth - 1)
    right = self.build_random_tree(depth - 1)
    TreeNode.new(rand(0..50), left, right)
  end

  def depth(node=root)
    return 0 if !node
    [depth(node.left), depth(node.right)].max + 1
  end

  # print the tree in-order (left, then root, then right)
  def in_order_traversal(tree=root, ordering=[])
    return if !tree
    # binding.pry
    in_order_traversal(tree.left, ordering)
    ordering << tree.value
    in_order_traversal(tree.right, ordering)
    ordering
  end

  # print the tree pre-order (root, then left, then right)
  def pre_order_traversal(tree=root, ordering=[])
    return if !tree
    ordering << tree.value
    pre_order_traversal(tree.left, ordering)
    pre_order_traversal(tree.right, ordering)
    ordering
  end

  # print the tree post-order (left, then right, then root)
  def post_order_traversal(tree=root, ordering=[])
    return if !tree
    post_order_traversal(tree.left, ordering)
    post_order_traversal(tree.right, ordering)
    ordering << tree.value
  end
end
