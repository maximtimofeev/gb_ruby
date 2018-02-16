# ship class
class Ship
  attr_reader :owner, :type
  attr_accessor :state, :coords

  TYPE_ERROR = 'Type of ship is incorrect'.freeze
  COORDS_ERROR = 'Amount of ship\'s coordinates is incorrect'.freeze

  def initialize(owner, type, ship_coords, state = 'alive')
    raise TYPE_ERROR unless (1..4).cover? type
    raise COORDS_ERROR unless Ship.built_correctly?(type, ship_coords)
    @owner = owner
    @type = type
    @coords = ship_coords
    @state = state
  end

  # def Ship.built_correctly?(type, coords)
  #   coords.count == type
  # end

  # def Ship.built_correctly?(type, coords)
  #   coords.length == type
  # end

  def self.built_correctly?(type, coords)
    coords.size == type
  end

  def self.how_many_ships(size)
    case size
    when 1..4
      5 - size
    else
      'Введено некорректное количество координат. Введите число от 1-4'
    end
  end
end
