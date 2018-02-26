# battle field class
class Field
  def initialize(a, b)
    @cells = Array.new(a * b)
  end

  def to_s
    @cells.to_s
  end
end

field = Field.new(10, 10)
puts field
