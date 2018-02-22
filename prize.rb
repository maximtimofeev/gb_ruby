require_relative 'worker/worker'

print 'Enter worker\'s name: '
name = gets.chomp
print 'Enter worker\'s salary: '
salary = gets.to_i

# 1, 2 tasks
if Worker.got_salary?(salary)
  prize = (salary + (salary * 0.1)).to_i

  # 1
  print 'Сотрудник ', name, ' в этом месяце получит ', prize, ' рублей!', "\n"

  # 2
  str = 'Сотрудник ' + name + ' в этом месяце получит ' + prize.to_s + ' рублей!'
  puts str
else
  puts 'Зарплата не была указана'
end
# 1, 2 tasks end

workers = []
3.times { workers << Worker.new(Worker::Data.read_name, Worker::Data.read_salary) }

workers.each do |worker|
  puts "Работник: #{worker.name}, заработная плата: #{worker.salary}"
end
