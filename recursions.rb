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

puts "Heaviest rock is: #{max_rock}"

## or with inject
puts "Heaviest rock is: #{rocks.inject { |max_rock, rock| max_rock > rock ? max_rock : rock }}"

#  Recursion

def rock_judger(rocks_arr)
  if rocks_arr.length <= 2  # the base case
    a = rocks_arr[0]
    b = rocks_arr[-1]
  else
    a = rock_judger(rocks_arr.slice!(0, rocks_arr.length / 2))
    b = rock_judger(rocks_arr)
  end

  a > b ? a : b
end
