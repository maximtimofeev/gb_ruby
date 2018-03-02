require_relative 'fifo'

# queue class
class Queue
  include Fifo

  def initialize
    @queue = []
  end

  def to_s
    @queue.to_s
  end
end

queue = Queue.new
queue.add(1, 2, 3, 4, 5)
puts queue, '---'
puts queue.remove, '---'
puts queue, '---'
