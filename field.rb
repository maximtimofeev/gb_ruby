require_relative 'coord'

# battle field class
class Field
  def initialize(a, b)
    @cells = []
    (0...a).map do |x|
      (0...b).map do |y|
        @cells << Coord.new(x, y)
      end
    end
  end

  def [](index)
    @cells[index]
  end

  def to_s
    @cells.to_s
  end
end
