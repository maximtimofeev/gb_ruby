require_relative 'coord'
# class for shots
class Shot < Coord
  def initialize(ship_coords)
    @ship_coords = ship_coords
  end

  def hit?(x, y)
    @ship_coords.include?([x, y])
  end
end
