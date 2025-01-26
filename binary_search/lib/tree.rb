# frozen_string_literal: true

require_relative 'node'
class Tree
  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def build_tree(array)
    balanced(array, 0, array.length - 1)
  end

  def balanced(data, first, last)
    return nil if first > last

    middle = (first + last) / 2
    node = Node.new(data[middle])
    node.left = balanced(data, first, middle - 1)
    node.right = balanced(data, middle + 1, last)
    node
  end

  def insert(data)
    node_new = Node.new(data)

    if @root.nil?
      @root = node_new
      return
    end

    node = @root
    while true
      if data < node.data
        if node.left.nil?
          node.left = node_new
          break
        else
          node = node.left
        end
      else
        if node.right.nil?
          node.right = node_new
          break
        else
          node = node.right
        end
      end
    end
  end
  def delete(value, node = @root)
    return nil if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      if node.left.nil?
        return node.right
      elsif node.right.nil?
        return node.left
      end

      temp = min_value_node(node.right)
      node.data = temp.data
      node.right = delete(temp.data, node.right)
    end
    node
  end

  def find(value, node = @root)
    until node.nil? || node.data == value
      node = value < node.data ? node.left : node.right
    end
    node
  end

  def level_order(&block)
    return [] if @root.nil?

    queue = [@root]
    result = []

    until queue.empty?
      current_node = queue.shift
      block_given? ? block.call(current_node) : result << current_node.data

      queue << current_node.left unless current_node.left.nil?
      queue << current_node.right unless current_node.right.nil?
    end

    result unless block_given?
  end

  def inorder(node = @root, &block)
    return [] if node.nil?

    result = []
    result += inorder(node.left, &block)
    block_given? ? block.call(node) : result << node.data
    result += inorder(node.right, &block)

    result
  end

  def preorder(node = @root, &block)
    return [] if node.nil?

    result = []
    block_given? ? block.call(node) : result << node.data
    result += preorder(node.left, &block)
    result += preorder(node.right, &block)

    result
  end

  def postorder(node = @root, &block)
    return [] if node.nil?

    result = []
    result += postorder(node.left, &block)
    result += postorder(node.right, &block)
    block_given? ? block.call(node) : result << node.data

    result
  end

  def height(node = @root)
    return -1 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    [left_height, right_height].max + 1
  end

  def depth(node = @root)
    return -1 if node.nil?

    current_node = @root
    depth = 0

    until current_node.nil? || current_node == node
      if node.data < current_node.data
        current_node = current_node.left
      else
        current_node = current_node.right
      end
      depth += 1
    end
    
    current_node == node ? depth : -1
  end

  def balance?(node = @root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    if(left_height - right_height).abs > 1
      return false
    end

    balance?(node.left) && balance?(node.right)
  end

  def rebalance
    sorted_array = inorder

    @root = build_tree(sorted_array)
  end

  private

  def min_value_node(node)
    current = node
    current = current.left until current.left.nil?
    current
  end
end
