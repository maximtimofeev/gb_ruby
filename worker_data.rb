# read worker's data
module WorkerData
  def self.read_name
    print 'Enter worker\'s name: '
    gets.chomp
  end

  def self.read_salary
    print 'Enter worker\'s salary: '
    gets.to_i
  end
end
