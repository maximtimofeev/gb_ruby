require_relative 'field'
require_relative 'ship'
require_relative 'shot'

field = Field.new(10, 10)
puts field

# coord = Coord.new(5, 7)
# ship_coords = [field[1][2], field[1][3], field[1][4]]

# ship = Ship.new('Max', 3, ship_coords)
# ship2 = Ship.new('Max', 3, ship_coords)
# shot = Shot.new(1, 2)

# puts "#{ship.similar} more ships of type #{ship.type}"
# puts "Ship has #{ship.hits} hit(s) taken. State: #{ship.state}"
# p ship.health
# puts shot.fire(ship)
# puts "Ship has #{ship.hits} hit(s) taken. State: #{ship.state}"
# p ship.health

