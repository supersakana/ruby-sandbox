# ruby oop.rb
module Life
    def speak(quote)
        puts quote
    end
end

class Humans
    include Life

    attr_accessor :name, :age

    def initialize(name = "Stranger", age = "immortal")
        @name = name
        @age = age
        puts "Hello #{name}, you are #{age}. Welcome to the club "
    end
end

zac = Humans.new("Zac", 22)
default = Humans.new

# puts zac.age
# puts zac.name
# zac.speak("What's up big pimps")


