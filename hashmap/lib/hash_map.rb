# frozen_string_literal: true

class HashMap
  def initialize(load_factor = 0.75, capacity = 16)
    @capacity = capacity
    @load_factor = load_factor
    @buckets = Array.new(@capacity) {[]}
    @size = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code
  end

  def set(key, value)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length

    bucket = @buckets[index]
    bucket.each do |pair|
      pair[1] = value if pair[0] == key
    end
    bucket << [key, value]
    @size += 1
  end

  def get(key)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length

    bucket = @buckets[index]
    bucket.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def has?(key)
    !get(key).nil?
  end

  def remove(key)
    index = hash(key) % @capacity

    raise IndexError if index.negative? || index >= @buckets.length

    bucket = @buckets[index]
    bucket.each do |pair|
      pair[1] = nil if pair[0] == key
    end
  end

  def length
    @size
  end

  def clear
    @buckets = Array.new(@capacity) { [] }
    @size = 0
  end

  def keys
    @buckets.flat_map { |pair| pair[0] }
  end

  def values
    @buckets.flat_map { |pair| pair[1] }
  end

  def entries
    @buckets.flat_map { |k, v| [k, v] }
  end
end
