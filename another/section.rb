require 'pry'

# section class
class Section
  include Enumerable

  def initialize(*members)
    @members = members.flatten
  end

  def each(&block)
    @members.each(&block)
    self
  end
end

childs = %w(Ivanov Petrov Sidorov Alekseeva Kazantseva Antropov Anisimova Kuznetsov Solovjev Koshkina)

section = Section.new(childs)
puts section.grep(/^A.*/)
