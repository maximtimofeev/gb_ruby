$LOAD_PATH << '.'

require 'ship'
require 'shot'
ship_coords = [[1, 2], [1, 3], [1, 4]]

ship = Ship.new('Max', 3, ship_coords)
shot = Shot.new(1, 2)

puts shot.fire(ship)

# shorter method start
# def my_loop
#   yield while true
# end

# my_loop { puts 'hello' }
# shorter method end

puts "Количество палуб 1: #{Ship.how_many_ships(1)} кораблей"
puts "Количество палуб 2: #{Ship.how_many_ships(2)} кораблей"
puts "Количество палуб 3: #{Ship.how_many_ships(3)} кораблей"
puts "Количество палуб 4: #{Ship.how_many_ships(4)} кораблей"
puts Ship.how_many_ships(0)
puts Ship.how_many_ships(5)

# puts 'Enter ship\'s owner: '
# ship_owner = gets.chomp

# puts 'Enter ship\'s type: '
# ship_type = gets.to_i

# ship_coords2 = []

# build ship way 1
# loop do
#   puts 'Enter cell coordinates: '
#   x = gets.to_i
#   y = gets.to_i
#   ship_coords2 << [x, y]
#   if ship_coords2.size == ship_type
#     break
#   end
# end

# build ship way 2
# while ship_coords2.size != ship_type
#   puts 'Enter cell coordinates: '
#   x = gets.to_i
#   y = gets.to_i
#   ship_coords2 << [x, y]
# end

# build ship way 3
# until ship_coords2.size == ship_type
#   puts 'Enter cell coordinates: '
#   x = gets.to_i
#   y = gets.to_i
#   ship_coords2 << [x, y]
# end
# ship2 = Ship.new(ship_owner, ship_type, ship_coords2)

# iterator map
arr = %w[cat dog tiger]
puts arr.map(&:upcase).concat(arr)

# only 't'
puts arr.select { |animal| animal.include?('t') }
