# shorter method start
# def my_loop
#   yield while true if block_given?
# end

# my_loop { puts 'hello' }
# shorter method end

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
