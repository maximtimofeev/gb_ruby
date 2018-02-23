require_relative 'constants'

# ship class
class Ship
  include Ship::Constant
  attr_reader :owner, :type
  attr_accessor :state, :coords, :health

  @@total_ships = 0
  @@ships = { 1 => 0, 2 => 0, 3 => 0, 4 => 0 }

  class << self
    def built_correctly?(type, coords)
      coords.size == type
    end

    def how_many_ships(size)
      case size
      when 1..Ship::MAX_SIZE
        5 - size
      else
        Ship::COORDS_ERROR
      end
    end
  end

  def initialize(owner, type, ship_coords, state = 'alive')
    check_args(type, ship_coords)
    count_total
    count_type(type)
    @owner = owner
    @type = type
    @coords = ship_coords
    @state = state
    @health = ship_coords
  end

  # methods for checking
  def check_args(type, ship_coords)
    raise Ship::TYPE_ERROR unless (1..Ship::MAX_SIZE).cover? type
    raise Ship::COORDS_ERROR unless Ship.built_correctly?(type, ship_coords)
  end

  def count_total
    if @@total_ships == Ship::MAX_SHIPS
      raise Ship::SHIP_LIMIT
    else
      @@total_ships += 1
    end
  end

  def count_type(type)
    if Ship.how_many_ships(type) == @@ships[type]
      raise Ship::SHIP_TYPE_LIMIT
    else
      @@ships[type] += 1
    end
  end
  # end methods for checking

  def similar
    @@ships[@type] - 1
  end

  def hits
    type - health.size
  end

  def take_hit(coords)
    health.delete(coords)
    @state = if health.empty?
               'dead'
             else
               'injured'
             end
  end
end
