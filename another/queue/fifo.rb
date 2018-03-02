# queue class
class Queue
  # queue module
  module Fifo
    def add(*elements)
      @queue << elements
      self
    end

    def remove
      @queue.pop
    end
  end
end
