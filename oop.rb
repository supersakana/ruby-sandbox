# ruby oop.rb
module Life
    def speak(quote)
        puts quote
    end
end


class Humans
    include Life

    attr_accessor :name, :age

    def initialize(name, age)
        @name = name
        @age = age
    end
end

zac = Humans.new("Zac", 22)

puts zac.age
puts zac.name
zac.name  = "Zachary"
zac.speak("What's up big pimps")
puts zac.name

