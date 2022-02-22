# ruby quiz.rb
# quiz link: https://www.codequizzes.com/ruby/beginner/modules-classes-inheritance

# Celsius class
class Celsius
    def initialize(temperature)
      @temperature = temperature
    end

    def to_faren
        return (@temperature * 1.8) + 32
    end
  end

  celsius = Celsius.new(20)
  puts celsius.to_faren

  # Create a dog class initialzied with a name
  class Dog
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def bark
      puts "Ruff ruff says #{@name}"
    end
  end

  frank = Dog.new("Frank")
  frank.bark

  # Add an isntance method to the insect class to calculate the age in years

  class Insect
    def initialize(age_in_days)
      @age_in_days = age_in_days
    end

    def age_in_years
      return @age_in_days / 365
    end
  end

  dragonfly = Insect.new(3285)
  puts dragonfly.age_in_years

  # create a lamp class with a class method called about_me that returns the string "We brighten up people's lives".

  class Lamp
    def self.about_me
      return "We brighten up people's lives"
    end
  end

  puts Lamp.about_me


# Add a method to the WaterBottle class that returns the size of the WaterBottle and demonstrate how this method can be used.

class WaterBottle
  attr_accessor :size

  def initialize(size)
    @size = size
  end
end

myBottle = WaterBottle.new(128)
puts myBottle.size

# Create a Person class that is initializzed with an age and create an age=() method that can be used to update the @age instance variable. Also include an age method that returns the value of the @age instance variable. Demonstrate how the methods can be used

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

zac = Person.new("Zac", 22)
puts zac.age

zac.age = 23
puts zac.age

# Create a module called MathHelper with a method multiply_by_two that takes a number as an argument and multiplies it by two. Create a class called Homework and demonstrate how multiply_by_two() can be used.

module MathHelper
  def multiply_by_two(number)
    return(number * 2)
  end
end

class Homework
  include MathHelper
end

myHomework = Homework.new
puts myHomework.multiply_by_two(5)


# Demonstrate the instances of the Dog class have access to the heartbeat? method
class Mammal
  def heartbeat?
    true
  end
end

class Dog < Mammal
end

billy = Dog.new
puts billy.heartbeat?

# Create a BaseballPlayer class that is initialized with hits, walks, and at_bats. Add a batting_average() method that returns hits divided by at_bats as a floating point number. Add an on_base_percentage() method that returns (hits + walks) divided by at_bats as a floating point number. Demonstrate how the batting_average() and on_base_percentage() methods can be used.
class BaseballPlayer

  def initialize(hits, walks, at_bats)
    @hits = hits
    @walks = walks
    @at_bats = at_bats
  end

  def batting_average 
    return(@hits.to_f / @at_bats)
  end

  def on_base_percentage
    return ((@hits + @walks).to_f / @at_bats).to_f
  end
end

barry_bonds = BaseballPlayer.new(330, 110, 1125)
puts barry_bonds.batting_average()
puts barry_bonds.on_base_percentage()

# Create a Person class that is initialized with a first name and last name. Create first_name() and last_name() methods that return the values of the corresponding instance variables. Create a full_name method that concatenates the first_name and last_name in a single string

class Person
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def first
    return (@first_name)
  end

  def last
    return (@last_name)
  end

  def full
    return ("#{@first_name} #{@last_name}")
  end
end

me = Person.new("Zac", "Williamson")
puts me.full


# Create a module called MathHelpers with the exponent() method that takes two numbers as arguments and raises the first number to the power of the second number. Create a class called Calculator with a method called square_root() that takes the square root of the number (raises it to the power of 0.5). The square_root() method should use the exponent() method

module MathHelpers
  def exponent(a, b)
    return (a ** b)
  end
end

class Calculator
  include MathHelpers

  def square_root(a)
    return exponent(a, 0.5)
  end
end

c = Calculator.new
puts c.square_root(4)
puts c.square_root(5)