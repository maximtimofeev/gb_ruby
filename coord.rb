require_relative 'ship'

# coordinates class
class Coord
  attr_accessor :coords, :state

  def initialize(x, y, state = 'empty')
    @coords = [x, y]
    @state = state
  end

  def to_ary
    @coords.to_ary
  end
  def to_s
    @coords.to_s
  end
end
