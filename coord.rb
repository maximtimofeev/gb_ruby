# coordinates class
class Coord
  attr_accessor :name, :type

  def initialize(*coords_list)
    @coords = coords_list
  end

  def built_correctly?
    @coords.size == @type
  end
end
