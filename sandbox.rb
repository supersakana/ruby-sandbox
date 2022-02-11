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

    