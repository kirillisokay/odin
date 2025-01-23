# frozen_string_literal: true
require_relative 'node'
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def head_val
    head.value
  end

  def tail_val
    tail.value
  end

  def append(val)
    if head.nil?
      @head = Node.new(val)
      @tail = head
    elsif head == tail
      @tail = Node.new(val, head)
      @head.next_node = @tail
    else
      @tail = tail.next_node = Node.new(val, @tail)
    end
  end

  def prepend(val)
    if head.nil?
      @head = Node.new(val)
      @tail = @head
    elsif head == tail
      @head = Node.new(val, tail)
      @head.next_node = @tail
    else
      @head = Node.new(val, nil, head)
    end
  end

  def size(current_node = head)
    return 1 if current_node.next_node.nil?
      
    size(current_node.next_node) + 1
  end

  def to_s
    list_items(head)
  end

  def list_items(current_node = head)
    return print "(#{current_node.value})-> " if current_node.next_node.nil?

    print "(#{current_node.value})-> "
    list_items(current_node.next_node)
  end

  def at(index, current_node = head)
    return nil if (index + 1) > size || index.negative?

    return current_node.value if index.zero?

    at(index - 1, current_node.next_node)
  end

  def pop
    @tail = tail.prev_node
    tail.next_node = nil
  end

  def contains?(val, current_node = head)
    return true if val == current_node.value
    return false if current_node.next_node.nil?

    contains?(val, current_node.next_node)
  end

  def find(val, current_node = head)
    return 0 if val == current_node.value
    return nil if current_node.next_node.nil?

    result = find(val, current_node.next_node)
    if result.nil?
      nil
    else
      result + 1
    end
  end
end
