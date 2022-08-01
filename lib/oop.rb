# ruby oop.rb
module Life
  def speak(quote)
    puts quote
  end
end

class Humans
  include Life

  attr_accessor :name, :age

  def initialize(name = 'Stranger', age = 'immortal')
    @name = name
    @age = age
    puts "Hello #{name}, you are #{age}. Welcome to the club "
  end
end

class Bottles
  def sing(num)
    if num == 0
      puts 'No bottles of beer on the wall, go to the store and buy more'
    elsif num == 1
      puts '1 more bottle of beer on the wall, throw it down kick it around no more bottles of beer on the wall'
      sing(num - 1)
    else
      puts "#{num} bottles of beer on the wall, throw it down kick it around #{num - 1} bottles of beer on the wall"
      sing(num - 1)
    end
  end
end

game = Bottles.new

game.sing(33)
