print 'Enter worker\'s name: '
name = gets.chomp
print 'Enter worker\'s salary: '
salary = gets.to_i

def got_salary?(salary)
  salary > 0
end

if got_salary?(salary)
  prize = (salary + (salary * 0.1)).to_i

  # 1
  print 'Сотрудник ', name, ' в этом месяце получит ', prize, ' рублей!', "\n"

  # 2
  str = 'Сотрудник ' + name + ' в этом месяце получит ' + prize.to_s + ' рублей!'
  puts str
else
  puts 'Зарплата не была указана'
end
