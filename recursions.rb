# This is a file all about recursions!

# A recursion is a function that calls itself

# A recursion needs a basecase which stops the recursive process from re-occuring.

def recursion_skeleton(n)
  # base case

  # recursive case
end

# NOTE! In general (but not always), recursive functions replace loops in non-recursive fucntions

# Below compares the difference betweeen a recursive function and a loop

# <--- Count Downs --->
# Loop
def countdown_loop(n)
  i = n
  while i > 0
    puts "#{i} is the number"
    i -= 1
  end
end
# countdown_loop(10)

# Recursion
def countdown_recursion(n)
  if n <= 0
    puts 'Yee yee'
    return
  end
  puts n
  countdown_recursion(n - 1)
end
# countdown_recursion(10)

# <--- Sum Range --->

# Loop
def sumrange_loop(n)
  total = 0
  i = n
  while i > 0
    puts i
    total += i
    i -= 1
  end
  total
end
# sumrange_loop(10)

# Recursion
def sumrange_recursion(n, total = 0)
  return total if n <= 1

  sumrange_recursion(n - 1, total + n)
end
# sumrange_recursion(10)

# <--- Print Children --->
# This example below shows the real benefit of using a recursive function, instead of having to loop through deep nested layers of a data structure, a recursion will recall itself until it hits every 'child' in the example below.
TREE = {
  name: 'Willy',
  children: [
    {
      name: 'Zac',
      children: []
    },
    {
      name: 'Zoe',
      children: [
        { name: 'Kyle', children: [] },
        { name: 'Sophia', children: [] }
      ]
    }
  ]
}

# Recursion
def print_children_recursive(tree)
  return if tree[:children].length.zero?

  tree[:children].each do |child|
    p child[:name]
    print_children_recursive(child)
  end
end

print_children_recursive(TREE)

# <--- Rock Examples --->
# Loop
# make some random rocks
rocks = 30.times.map { rand(1..200) }
puts rocks.join(', ')
max_rock = 0

rocks.each do |rock|
  max_rock = rock if max_rock < rock
end

# puts "Heaviest rock is: #{max_rock}"

## or with inject
puts "Heaviest rock is: #{rocks.inject { |max_rock, rock| max_rock > rock ? max_rock : rock }}"

#  Recursion

def rock_judger(rocks_arr)
  if rocks_arr.length <= 2 # the base case
    a = rocks_arr[0]
    b = rocks_arr[-1]
  else
    a = rock_judger(rocks_arr.slice!(0, rocks_arr.length / 2))
    b = rock_judger(rocks_arr)
  end

  a > b ? a : b
end

# <--- Factorial  Quiz Problems--->

def factorial(n)
  if n == 0
    1
  else
    n * factorial(n - 1)
  end
end

# my default way
# def palendrome(string)
#   string == string.reverse
# end

def palindrome(string)
  if string.length == 1 || string.length.zero?
    true
  elsif string[0] == string[-1]
    palindrome(string[1..-2])
  else
    false
  end
end

# 99 bottles problem, recursive solution
def bottles(n)
  if n.zero?
    puts 'No more bottles of beer on the wall, Go back to the store you alcoholic'
  elsif n == 1
    puts "#{n} more bottle of beer on the wall, take one down throw it around, no more bottles of beer on the wall"
    bottles(n - 1)
  else
    puts "#{n} bottles of beer on the wall, #{n}, take one down throw it around, #{n - 1} bottles of beer on the wall"
    bottles(n - 1)
  end
end
bottles(20)

#  Fibbonacci
def fib(n)
  if n.zero?
    0
  elsif n == 1
    1
  else
    fib(n - 1) + fib(n - 2)
  end
end
# fib(5)

# Flatten
def flatten(array, result = [])
  array.each do |element|
    if element.kind_of?(Array
      flatten(element, result)
    else
      result << element
    end
  end 
  result
end


# Roman Numerables
roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def romanize(n, roman = "")
  

end