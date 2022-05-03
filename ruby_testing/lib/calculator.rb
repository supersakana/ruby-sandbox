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

  def subtract(first_num, *arguments)
    difference = first_num
    arguments.each { |num| difference -= num }
    difference
  end

  def divide(first_num, *arguments)
    quotient = first_num
    arguments.each { |num| quotient /= num }
    quotient
  end
end

# NOTE! method(*arguments) - the * can be used to avoid the code failing if there are more than expected variables to pass
