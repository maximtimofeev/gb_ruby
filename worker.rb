require_relative 'errors'
require_relative 'worker_data'

# worker
class Worker
  include WorkerData
  attr_accessor :name, :salary

  def initialize(name, salary)
    raise NAME_EMPTY if name.to_s == ''
    raise SALARY_INCORRECT unless salary.is_a? Numeric
    @name = name
    @salary = salary
  end

  def self.got_salary?(salary)
    salary > 0
  end

  def print
    puts [name, salary]
  end
end
