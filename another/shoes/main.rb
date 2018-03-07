require 'green_shoes'
require_relative 'draw/draw'
require_relative 'ship'

Shoes.app width: 520, height: 600 do
  extend Draw
  GAME = Draw::Game.new
  SHIP = Ship.new

  @slot = stack(width: 520, height: 20) { para '' }

  draw_board

  button('OK') do
    flow do
      if ships_added?
        @slot.clear { para 'Начинаем игру!' }
      else
        @slot.clear { para 'Что-то не так. Проверьте расстановку кораблей!' }
      end
    end
  end

  button('Clear') do
    clear_board
    @slot.clear
  end

  click do |button, x, y|
    if coords = find_piece(x, y)
      fill_rectangle coords
    end
  end
end
