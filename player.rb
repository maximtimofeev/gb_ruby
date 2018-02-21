# player with shots
class Player
  include Comparable
  attr_accessor :lacky_shots

  def initialize(shots = 0)
    @lacky_shots = shots
  end

  def <=>(other)
    @lacky_shots <=> other.lacky_shots
  end
end

print 'Enter p1 shots: '
p1 = Player.new(gets.to_i)
print 'Enter p2 shots: '
p2 = Player.new(gets.to_i)

if p1 > p2
  puts 'Выигрывает 1'
elsif p1 == p2
  puts 'Ничья'
elsif p1 < p2
  puts 'Выигрывает 2'
end
