require_relative 'coord'

# class for shots
class Shot < Coord
  def hit?(coord)
    @coords.include?(coord)
  end

  def fire(ship, coord)
    if self.hit?(coord)
      if ship.state == 'dead'
        puts "#{coord}: shot hitted already"
      else
        puts ship.state
      end
      puts "#{coord}: shot hitted"
    else
      puts "#{coord}: shot missed"
    end
  end
end
