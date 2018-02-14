# coordinates class
class Coord
  attr_accessor :name, :type

  def initialize(*coords_list)
    @coords = []
    coords_list.each { |coord| @coords << coord }
  end

  def built_correctly?
    @coords.size == @type
  end
end
