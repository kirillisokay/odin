# frozen_string_literal: true

def stock_picker(array)
  profit = 0
  days = [0, 0]
  array.each_with_index do |buy, index|
    array.each_with_index do |sell, index2|
      next if index2 <= index

      if sell - buy > profit
        profit = sell - buy
        days = [index, index2]
      end
    end
  end
  days
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
