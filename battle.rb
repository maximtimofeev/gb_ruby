$LOAD_PATH << '.'

require 'ship'
require 'shot'

ship = Ship.new('Max', 3)
coord = Coord.new([1, 2], [1, 3], [1, 4])
coord.type = 4
puts coord.built_correctly?

shot = Shot.new([1, 2], [1, 3], [1, 4])
shot.type = 3
puts shot.fire(ship, [1, 4])