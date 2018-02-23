require_relative 'coord'

# class for shots
class Shot < Coord
  def hit?(ship)
    ship.coords.include?(coords)
  end

  def fire(ship)
    if hit?(ship)
      ship.take_hit(coords)
      puts "#{coords}: shot hitted"
    else
      puts "#{coords}: shot missed"
    end
  end
end
