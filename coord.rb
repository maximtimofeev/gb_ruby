require_relative 'ship'

# coordinates class
class Coord
  attr_accessor :coords, :state

  def initialize(x, y, state = 'empty')
    @coords = [x, y]
    @state = state
  end

  def [](index)
    @coords[index]
  end

  def ==(other)
    return @coords == other if other.respond_to? :[]
    super
  end

  def to_a
    @coords
  end

  def to_s
    "#{@coords.to_s}, state: #{state}"
  end
end
