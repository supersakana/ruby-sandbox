# lib/calculator.rb

# dummy class for practicing rspec
class Calculator
  def add(*arguments)
    arguments.sum
  end

  def multiply(*arguments)
    product = 1
    arguments.each { |num| product *= num }
    product
  end
end

# NOTE! method(*arguments) - the * can be used to avoid the code failing if there are more than expected variables to pass
