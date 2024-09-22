# frozen_string_literal: true

def bubble_sort(array)
  array if array.size <= 1
  loop do
    swapped = false
    (array.length - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end
    break if not swapped
  end
  array
end

p bubble_sort([0,2,2,3,4,78])

