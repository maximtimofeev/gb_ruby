# iterator map
arr = %w[cat dog tiger]
puts arr.map(&:upcase).concat(arr)

# only 't'
puts(arr.select { |animal| animal.include?('t') })
