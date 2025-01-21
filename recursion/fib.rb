# frozen_string_literal: true

def fibs(num)
  sequence = [0, 1]
  (2..num).each do
    sequence << sequence[-1] + sequence[-2]
  end
  sequence[0..num]
end

fibs(8)

def fibs_rec(num, sequence = [0, 1])
  puts 'This was printed recursively'
  return sequence if sequence[-1] >= num

  sequence << sequence[-1] + sequence[-2]
  fibs_rec(num, sequence)
end

fibs_rec(8)


