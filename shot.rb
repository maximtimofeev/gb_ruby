require_relative 'coord'

# class for shots
class Shot < Coord
  def hit?(ship)
    ship.coords.include?(@coords)
  end

  def fire(ship)
    if hit?(ship)
      if ship.state == 'dead'
        puts "#{@coords}: shot hitted already"
      else
        puts ship.state
      end
      puts "#{@coords}: shot hitted"
    else
      puts "#{@coords}: shot missed"
    end
  end
end
