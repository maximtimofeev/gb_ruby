require 'pry'

# section class
class Section
  include Enumerable

  def initialize(members)
    @members = members
  end

  def each(&block)
    @members.each(&block)
    self
  end
end

childs = {
  'Ivanov' => 3,
  'Petrov' => 5,
  'Sidorov' => 7,
  'Alekseeva' => 3,
  'Kazantseva' => 2,
  'Antropov' => 4,
  'Anisimova' => 1,
  'Kuznetsov' => 8,
  'Solovjev' => 9,
  'Koshkina' => 4
}
section = Section.new(childs)
puts 'Task 2 result:'
p(section.find { |pupil, _tasks| pupil.match(/^A/) }) # task_2

puts 'Task 3 result:'
p(section.find_all { |pupil, _tasks| pupil.match(/^A/) }) # task_3

puts 'Task 4 result:'
p(section.max_by { |_pupil, tasks| tasks }) # task_4
