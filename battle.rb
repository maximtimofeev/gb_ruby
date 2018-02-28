require_relative 'field'
require_relative 'ship'
require_relative 'shot'

field = Field.new(10, 10)
ship_coords = [field[1][2], field[1][3], field[1][4]]
ship_coords2 = [field[4][5], field[4][6], field[4][7]]

ship = Ship.new('Max', 3, ship_coords, field)
ship2 = Ship.new('Max', 3, ship_coords2, field)
shot = Shot.new(1, 2)
shot2 = Shot.new(5, 2)

puts "Ship has #{ship.hits} hit(s) taken. State: #{ship.state}"
puts shot.fire(ship, field) # ship gots hit
puts "Ship has #{ship.hits} hit(s) taken. State: #{ship.state}"
puts shot2.fire(ship, field) # sea gots hit
puts field.to_s # show field's statement
ship.delete # delete from field
puts Ship.how_many_ships(4)
