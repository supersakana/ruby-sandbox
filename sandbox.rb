# Get the users name 
puts 'What is your name?'
name = gets.chomp
puts 'Hello ' + name + '!'

# User's Age
puts 'How old are you?'
age = gets.chomp

puts 'in 10 years, you will be:'
puts age + 10

puts 'in 20 years, you will be:'
puts age + 20

puts 'in 30 years, you will be:'
puts age + 30

# Prints the user's name 10 times
10.times do
    puts name
end

# Get the user's first and last name 
puts 'What is your first name?'
first_name = gets.chomp

puts 'What is your last name?'
last_name = gets.chomp

puts 'Your full name is: ' + first_name + ' '  + last_name

# Number between 0-100

puts 'Please enter a number 0 - 100'
number = gets.chomp.to_i

if number <= 50
    puts 'Your number is less than 50'
elseif number <= 100 
    puts 'Your number value is between 51 and 100'
elseif number > 100 
    puts 'Your number is greater than 100'
else 
    puts 'You cannot put a negative number'
end

def even_odd(number)
    unless number.is_a? Numeric
      return "A number was not entered."
    end
  
    if number % 2 == 0
      "That is an even number."
    else
      "That is an odd number."
    end
  end

# Method that takes name and prints message
def hi_name(name)
   'hi ' + name + ', you are welcome here.' 
end

puts hi_name('Zac')

#Method that multiplies

def multiply(a, b)
  a * b
end

puts multiply(3, 9)
