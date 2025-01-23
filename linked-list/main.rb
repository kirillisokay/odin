# frozen_string_literal: true
require_relative 'lib/linked_list'

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
p list.list_items
p list.pop
p list.list_items
p list.contains?('cat')
p list.find('snake')
