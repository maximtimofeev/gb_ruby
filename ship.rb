require_relative 'constants'
require 'pry'
# ship class
class Ship
  include Constant
  attr_reader :owner, :type
  attr_accessor :state, :coords, :health

  @@total_ships = 0
  @@ships = {
    FOUR_DECK => 0,
    THREE_DECK => 0,
    TWO_DECK => 0,
    ONE_DECK => 0
  }

  class << self
    def built_correctly?(type, coords)
      coords.size == type
    end

    def how_many_ships(size)
      (1..Ship::MAX_SIZE).cover?(size) ? 5 - size : Ship::COORDS_ERROR
    end

    def in_field?(coords, field)
      correct = true
      coords.map do |coord|
        correct && field[coord.to_a.first][coord.to_a.last] == coord
      end
    end

    def correct_place?(coords, field)
      outer_space = []
      coords_a = []
      correct = true

      coords.map do |coordinate|
        coord = coordinate.to_a
        coords_a << coord
        outer_space << [coord.first, coord.last + 1]
        outer_space << [coord.first, coord.last - 1]
        outer_space << [coord.first + 1, coord.last]
        outer_space << [coord.first - 1, coord.last]
        outer_space << [coord.first + 1, coord.last + 1]
        outer_space << [coord.first + 1, coord.last - 1]
        outer_space << [coord.first - 1, coord.last + 1]
        outer_space << [coord.first - 1, coord.last - 1]
      end
      outer_space -= coords_a
      outer_space.uniq!

      outer_space.map do |coord|
        cell_state = field[coord.to_a.first][coord.to_a.last].state
        correct && (cell_state == 'empty' || cell_state == nil)
      end
    end
  end

  def initialize(owner, type, ship_coords, field, state = 'alive')
    check_args(type, ship_coords, field)
    count_total
    count_type(type)
    ship_coords.each { |coord| coord.state = 'ship' }  
    @owner = owner
    @type = type
    @coords = ship_coords
    @state = state
    @health = ship_coords
  end

  # methods for initializing
  def check_args(type, ship_coords, field)
    raise TYPE_ERROR unless (1..MAX_SIZE).cover? type
    raise COORDS_ERROR unless Ship.built_correctly?(type, ship_coords)
    raise OUT_OF_FIELD unless Ship.in_field?(ship_coords, field)
    # raise ANOTHER_SHIP_CLOSE if Ship.correct_place?(ship_coords, field)
  end

  def count_total
    raise SHIP_LIMIT if @@total_ships == MAX_SHIPS
    @@total_ships += 1
  end

  def count_type(type)
    raise SHIP_TYPE_LIMIT if Ship.how_many_ships(type) == @@ships[type]
    @@ships[type] += 1
  end
  # end methods for initializing

  def similar
    @@ships[@type] - 1
  end

  def hits
    type - health.size
  end

  def take_hit(coords)
    health[health.index(coords)].state = 'smashed'
    @state = health.empty? ? 'dead' : 'injured'
  end

  def delete
    @coords.each { |coord| coord.state = 'empty' }
  end
end
