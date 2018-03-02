str = '[12,122]'
puts 'Task 5a: match!' if str.match(/\[\d*,\d*\]/) # task 5a

str = '[5,6]'
puts 'Task 5b: match!' if str.match(/\[[0-9],[0-9]\]/) # task 5b

str = '[g10]'
puts 'Task 6: match!' if str.match(/\[[a-k]([1-9]|10)\]/) # task 6
