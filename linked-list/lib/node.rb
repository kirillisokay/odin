# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node, :prev_node

  def initialize(value, prev_node = nil, next_node = nil)
    @value = value
    @next_node = next_node
    @prev_node = prev_node
  end
end
