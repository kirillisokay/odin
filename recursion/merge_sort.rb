# frozen_string_literal: true
def merge_sort(array)
  return array if array.length <= 1

  mid = array.length / 2
  left_half = merge_sort(array[0...mid])
  right_half = merge_sort(array[mid..])

  merge(left_half, right_half)
end

def merge(left, right)
  sorted = []

  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end

  sorted + left + right
end

arr1 = [3, 2, 1, 13, 8, 5, 0, 1]
arr2 = [105, 79, 100, 110]

sorted_array = merge_sort(arr2)
puts sorted_array.inspect
