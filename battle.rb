class Ship

  attr_reader :owner, :type, :state

  def initialize(owner, type, state = 'alive')
    raise 'Type of ship is incorrect' unless (1..4).include? type
    @owner =owner
    @type = type
    @state = state
  end

end

class Shot

  def initialize(ship_coords)
    @ship_coords = ship_coords
  end

  def hit?(x, y)
    @ship_coords.include?([x, y])
  end

end

enemy_ship = [[4,6], [5,6], [6,6]]

ship = Ship.new('Max', 3)
shot = Shot.new(enemy_ship)

puts "Ship\'s owner : #{ship.owner}"
puts "Ship\'s type : #{ship.type}"
puts "Ship\'s state : #{ship.state}"
puts "Enemy ship got hit : #{shot.hit?(5, 6)}"