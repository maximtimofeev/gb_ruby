# ship
class Ship
  # ship errors
  module Constant
    TYPE_ERROR = 'Type of ship is incorrect'.freeze
    COORDS_ERROR = 'Amount of ship\'s coordinates is incorrect'.freeze
    SHIP_LIMIT = 'Ship\'s limit is reached'.freeze
    SHIP_TYPE_LIMIT = 'Too many ships of this type'.freeze

    MAX_SHIPS = 10
    MAX_SIZE = 4
  end
end
