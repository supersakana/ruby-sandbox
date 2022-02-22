# ruby quiz.rb

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
  end

  frank = Dog.new("Frank")
  puts frank.name