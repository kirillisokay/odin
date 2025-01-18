module Enumerable
  def return_no_block
    return unless block_given?
  end

  # Your code goes here
  def my_each(&block)
    return_no_block
    each(&block)
  end

  def my_all?
    return_no_block
    my_each do |elem|
      return false unless yield(elem)
    end

    true
  end

  def my_any?
    my_each do |element|
      if block_given?
        return true if yield(element)
      elsif element
        return true
      end
    end
    false
  end

  def my_count
    count = 0
    each do |el|
      if block_given?
        count += 1 if yield(el)
      else
        el ? count += 1 : 0
      end
    end
    count
  end

  def my_each_with_index(&block)
    return 0 unless block_given?

    each_with_index(&block)
  end

  def my_inject(val)
    result = val
    each do |item|
      result = yield(result, item)
    end
    result
  end

  def my_map
    return unless return_no_block

    result = []

    each do |item|
      result << yield(item)
    end
    result
  end

  def my_none?
    return unless return_no_block

    each do |item|
      return false if yield(item)
    end
  end

  def my_select
    return_no_block
    result = []
    each do |item|
      result << item if yield(item)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
end
