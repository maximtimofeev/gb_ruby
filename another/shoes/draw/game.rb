# draw module
module Draw
  # game class
  class Game
    BOARD_SIZE = [10, 10]
    attr_accessor :board, :battle_field

    def initialize
      @board = new_board
      @battle_field = new_board
    end

    def new_board
      Array.new(BOARD_SIZE[0]) { Array.new(BOARD_SIZE[1]) }
    end
  end
end