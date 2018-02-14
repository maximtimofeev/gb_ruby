# ship class
class Ship
  attr_reader :owner, :type
  attr_accessor :state

  def initialize(owner, type, state = 'alive')
    raise 'Type of ship is incorrect' unless (1..4).cover? type
    @owner = owner
    @type = type
    @state = state
  end
end
