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