require_relative 'ship'

# coordinates class
class Coord
  attr_accessor :name, :type, :coords

  def initialize(x, y)
    @coords = [x, y]
  end
end
