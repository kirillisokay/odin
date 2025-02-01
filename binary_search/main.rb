# frozen_string_literal: true

require_relative 'lib/tree'

array = [10, 20, 30, 40, 50, 60, 70]
tree = Tree.new(array)

puts 'Tree structure:'
tree.pretty_print

puts "Inorder traversal (no block): #{tree.inorder}"
puts 'Inorder traversal (with block):'
tree.inorder { |node| puts node.data }

puts "Preorder traversal (no block): #{tree.preorder}"
puts 'Preorder traversal (with block):'
tree.preorder { |node| puts node.data }

puts "Postorder traversal (no block): #{tree.postorder}"
puts 'Postorder traversal (with block):'
tree.postorder { |node| puts node.data }

root_height = tree.height
puts "Height of the root node: #{root_height}"

node = tree.find(20)
if node
  node_height = tree.height(node)
  puts "Height of node with value 20: #{node_height}"
else
  puts 'Node with value 20 not found.'
end

leaf_node = tree.find(10)
if leaf_node
  leaf_height = tree.height(leaf_node)
  puts "Height of leaf node with value 10: #{leaf_height}"
else
  puts 'Leaf node with value 10 not found.'
end

root_depth = tree.depth(tree.find(40))
puts "Depth of the root node: #{root_depth}"

node = tree.find(20)
if node
  node_depth = tree.depth(node)
  puts "Depth of node with value 20: #{node_depth}"
else
  puts 'Node with value 20 not found.'
end

leaf_node = tree.find(10)
if leaf_node
  leaf_depth = tree.depth(leaf_node)
  puts "Depth of leaf node with value 10: #{leaf_depth}"
else
  puts 'Leaf node with value 10 not found.'
end

puts "Is the tree balanced? #{tree.balance?}"

tree.insert(80)
tree.insert(90)

puts 'Updated tree structure:'
tree.pretty_print

puts "Is the tree balanced after insertion? #{tree.balance?}"


tree.rebalance

puts "Tree structure after rebalancing:"
tree.pretty_print

puts "Is the tree balanced after rebalancing? #{tree.balanc?}"

