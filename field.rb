require_relative 'coord'

# battle field class
class Field
  def initialize(a, b)
    x = -1
    @cells = Array.new(a) do
      x += 1
      y = -1
      Array.new(b) { Coord.new(x, y += 1) }
    end
  end

  def [](index)
    @cells[index]
  end

  def to_s
    @cells
  end

  def each
    @cells.each { |cell| yield cell } if block_given?
  end
end
