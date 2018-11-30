#FILO
class Stack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(el)
    self.stack = [el] + stack
  end

  def pop
    popped = stack.first
    self.stack = stack.drop(1)
    popped
  end

  def peek
    stack.first
  end
end

#FIFO
class Queue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    self.queue = [el] + queue
  end

  def dequeue
    dequeued = queue.last
    self.queue = queue[0...-1]
  end

  def peek
    queue.last
  end
end

class Map
  attr_accessor :map

  def initialize
    @map = []
  end

  def set(key, value)
    keys = []
    map.each do |pair|
      keys << pair[0]
    end

    if keys.include? key
      map.each_index do |idx|
        map[idx][1] = value if map[idx][0] == key
      end
    else
      map << [key, value]
    end
  end

  def get(key)
    map.each_index do |idx|
      return map[idx][1] if map[idx][0] == key
    end
  end

  def delete(key)
    key_idx = nil
    map.each_index do |idx|
      key_idx = idx if map[idx][0] == key
    end

    key_idx.nil? ? "No value found" : map.delete_at(key_idx)
  end

  def show
    map
  end
end