require_relative 'game'

module Draw
  PIECE_WIDTH = 32
  PIECE_HEIGHT = 32
  TOP_OFFSET = 47
  LEFT_OFFSET = 12

  def left_top_corner_of_piece(a,  b)
    [(a * PIECE_WIDTH + LEFT_OFFSET), (b * PIECE_HEIGHT + TOP_OFFSET)]
  end

  def draw_board
    stack  width: width, height: 500 do
      fill white
      GAME.board.each_with_index do |col, col_index|
        col.each_with_index do |cell, row_index|
          strokewidth 1
          stroke black
          left, top  = left_top_corner_of_piece(col_index, row_index)
          r = rect left: left, top: top, width: PIECE_WIDTH, height: PIECE_HEIGHT
          GAME.board[col_index][row_index] = r
        end
      end
    end
  end

  def clear_board
    draw_board
    GAME.battle_field.each_with_index do |row_array, row|
      row_array.each_with_index do |col_array, col|
        GAME.battle_field[row][col] = nil
      end
    end
  end

  def find_piece(x, y)
    GAME.board.each_with_index do |row_array, row|
      row_array.each_with_index do |col_array, col|
        left, top = left_top_corner_of_piece(col, row)
        right, bottom = right_bottom_corner_of_piece(col, row)
        return col, row if (left..right).include? x and (top..bottom).include? y
      end
    end
  end

  def right_bottom_corner_of_piece(a, b)
    left_top_corner_of_piece(a, b).map { |coord| coord + PIECE_WIDTH }
  end

  def fill_rectangle(coords)
    col, row = coords
    if (0..9).include? col and (0..9).include? row
      fill black
      rect(
        left: GAME.board[col][row].left,
        top: GAME.board[col][row].top,
        width: PIECE_WIDTH,
        height: PIECE_HEIGHT
      )
      mark_on_battle_field col, row
    end
  end

  def mark_on_battle_field(col, row)
    GAME.battle_field[col][row] ||=  1
  end

  def ships_added?
    corner_correct = true
    SHIP.reset
    GAME.board.each_with_index do |row_array, row|
      break if !corner_correct
      row_array.each_with_index do |col_array, col|
        if GAME.battle_field[col][row] == 1 and SHIP.non_repeat_coords?(col, row)
          corner_correct = SHIP.correct_corners?(col, row, GAME.battle_field)
          break if !corner_correct
          SHIP.find_ship(col, row, ship = [], GAME.battle_field)
        end
      end
    end
    SHIP.add_ship_to_hash
    corner_correct && SHIP.correct_amount?
  end
end
