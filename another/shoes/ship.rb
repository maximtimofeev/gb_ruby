class Ship
  CELL = { 1 => 4, 2 => 3, 3 => 2, 4 => 1 }
  attr_accessor :overall, :hash

  def initialize
    reset
  end

  def reset
    @overall = []
    @hash = { 1 => [], 2 => [], 3 => [], 4 => [] }
  end

  def find_ship(col, row, ship, battle_field)
    ship << [col, row]                                               #1
    l, r, t, b = 1, 1, 1, 1                                          #2
    sides = {}
    sides = define_sides(sides, col, row, battle_field)              #3
    while sides.has_value? 1                                         #4
      if sides['left'] == 1
        ship << [col - l, row]
        l += 1
      elsif sides['right'] == 1
        ship << [col + r, row]
        r += 1
      elsif sides['top'] == 1
        ship << [col, row + t]
        t += 1
      elsif sides['bottom'] == 1
        ship << [col, row - b]
        b += 1
      end
      sides = define_sides(l, r, t, b, sides, col, row, battle_field) #5
    end
    @overall << ship.sort!                                            #6
  end

  def non_repeat_coords?(col, row)
    @overall.empty? || @overall.map{ |ship| ship.include? [col, row] }.uniq == [false]
  end

  def add_ship_to_hash
    @overall.each { |ship| SHIP.hash[ship.size] << ship }
  end

  def correct_amount?
    @hash.map { |i, a| a.size == CELL[i] }.all?
  end

  def correct_corners?(col, row, battle_field)
    left_top, right_top, left_bottom, right_bottom = define_corners(col, row, battle_field)
    left_bottom == nil and right_top == nil and left_top == nil and right_bottom == nil
  end

  private

  def define_sides(l = 1, r = 1, t = 1, b = 1, sides, col, row, battle_field)
    sides['bottom'] = battle_field[col][row - b] if (row - b) > -1
    sides['top'] = battle_field[col][row + t] if (row + t) < Draw::Game::BOARD_SIZE[1]
    sides['right'] = battle_field[col + r][row] if (col + r) < Draw::Game::BOARD_SIZE[0]
    sides['left'] = battle_field[col - l][row] if (col - l) < -1
    sides
  end

  def define_corners(col, row, battle_field)
    left_top = battle_field[col - 1][row - 1] if (col - 1 > -1) && (row - 1 > -1)
    right_top = battle_field[col + 1][row - 1] if (col + 1 < Draw::Game::BOARD_SIZE[1]) && (row - 1 > -1)
    left_bottom = battle_field[col - 1][row + 1] if (col - 1 > -1) && (row + 1 < Draw::Game::BOARD_SIZE[1])
    right_bottom = battle_field[col + 1][row + 1] if  (col + 1 < Draw::Game::BOARD_SIZE[1]) && (row + 1 < Draw::Game::BOARD_SIZE[1])
    [left_top, right_top, left_bottom, right_bottom]
  end
end
