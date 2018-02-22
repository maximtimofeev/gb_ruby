# read worker's data
class Worker
  # module
  module Data
    def self.read_name
      print 'Enter worker\'s name: '
      gets.chomp
    end

    def self.read_salary
      print 'Enter worker\'s salary: '
      gets.to_i
    end
  end
end
