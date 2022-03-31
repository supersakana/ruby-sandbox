# Blocks arwe used everywhere in Ruby. You'll find many use cases and see the used extensivly in code libraries. They allow callers of mthods to pass in some contextual information which might other wise be hard to do without having numerous methods to handle different scenarios

Learning Outcomes
- 'What is a block'
# A block can declare a multiline or single line and are anonymous functions thar can be passed into methods
- 'How is a block like a method'
# They can both pass arguments through them
- 'What are the two ways of declaring a block'
# Multi-line Single-line
- 'Why would you use a block instead of just creating a method'
# Blocks can be written in the context of enumerbale methods, adn you can write your own methods that accept bocks and even store blocks as variables (Proc/Lambdas)
- 'What does' yield 'do?'
# Yield is a keyword that can be called inside a method to relinquish execution to the accompanying block. 
- 'How do you pass arguments to a block from within a method'
- 'How do you check whether a block was actually passed in?'
- 'What is a proc'
- 'What is a lambda'
- 'What is the difference between a proc ad block'
- 'What is the difference between a lambda and proc?'



#  <-- Blocks -->

# Single-line block
[1,2,3].each { |num| puts num }

# Multi-line block
[1,2,3].each do |num|
  puts num
end

#  <-- Yield -->
# As we can see below, the yeild keyword defined in a method "waits" for execution and takes a block (anonymous function) to let the user define the functionality

def logger
    yield
  end

  logger { puts 'hello from the block' }
#=> hello from the block

logger do
    p [1,2,3]
  end
  #=> [1,2,3]

#   Yield can be called multiple times and execute the same opperation as displayed below
  def double_vision
    yield
    yield
  end
  
  double_vision { puts "How many fingers am I holding up?" }
  #=> How many fingers am I holding up?
  #=> How many fingers am I holding up?

#   You can also call yield and pass arguments through with different results. 
  def love_language
    yield('Ruby')
    yield('Rails')
  end
  
  love_language { |lang| puts "I love #{lang}" }
  #=> I love Ruby.
  #=> I love Rails.

#   The method below shows how you can combine the #each enumerable with yield to iterate through each transaction and yield a block for the user to customize the output.
@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement
  @transactions.each do |transaction|
    yield transaction # You just yield the transaction amount.
  end
end

transaction_statement do |transaction|
  p "%0.2f" % transaction # The bank that calls the method can define how it is handled.
end
#=> ["10.00", "-15.00", "25.00", "30.00", "-24.00", "-70.00", "999.00"]

# If you do NOT pass an argument through a yield statment, you're returned with nil as seen below...
def say_something
    yield # No arguments are passed to yield
  end
  
  say_something do |word| # But the block expects one argument to be passed in
    puts "And then I said: #{word}"
  end
  #=> And then I said:

  #  <-- Block Control -->
  
#   Oftentimes, the person who writes a method and the person who callsa method are different people. 

def simple_method
    yield
  end
  
  simple_method
  # => `simple_method': no block given (yield) (LocalJumpError)

  #block_given, is a method that checks if a block has been givin or not (true, false)
  def maybe_block
    if block_given?
      puts "block party"
    end
    puts "executed regardless"
  end
  
  maybe_block
  # => executed regardless
  
  maybe_block {} # {} is just an empty block
  # => block party
  # => executed regardless


  #  <-- Lambdas -->
# A Lmabda is a way to write a block and save it to a variable (Just like JavaScript functions!). 

my_lambda = lambda { puts "my lambda" }

my_other_lambda = -> { puts "hello from the other side" }

# There are 2 options for accepting arguments in lambdas

my_name = ->(name) { puts "hello #{name}" }

my_age = lambda { |age| puts "I am #{age} years old" }


my_name.call("tim")
#=> hello tim
my_age.call(78)
#=> I am 78 years old

  #  <-- Procs -->
# A proc is an object that youc an use to store blocks and pass them around like variables. NOTE a lambda is a type of proc object but with some distinct behaviors...

a_proc = Proc.new { puts "this is a proc" }

a_proc.call
#=> this is a proc

  #  <-- Procs Vs Lambdas -->
#   Procs behave just like blocks except that a proc does NOT care if you pass more, less, or no arguments that you specify(assigns nil).

# In the example below, the output shows b as nil
a_proc = Proc.new { |a, b| puts "a: #{a} --- b: #{b}" }

a_proc.call("apple")
# => a: apple --- b:

# Select has 2 arguments specified |a, b|  each iteration passes a single element of each nested array (a = 1, b = 2). This is treated a s a non-lambda proc and other enumerables use this same thing
nested_array = [[1, 2], [3, 4], [5, 6]]
nested_array.select {|a, b| a + b > 10 }

# => [5, 6]

# Unlike proks, a lambda DOES care about how many arguments are passed through and will raise an error if you dont honor the parameters expected. 

a_proc = lambda { |a, b| puts "a: #{a} --- b: #{b}" }

a_proc.call("apple")
# => wrong number of Arguments (given 1, expected 2) (ArgumentError)

a_proc.call("apple", "banana", "cake")
# => wrong number of Arguments (given 3, expected 2) (ArgumentError)

# Another difference between both lambdas and procs is returning.

# When writting and explicit return inside a lambda, it returns form the lambda block to the caller. 
a_lambda = -> { return 1 }

a_lambda.call
# => 1

# A proc however returns the context in which it is called, so if your return is at the top level, there is no caller to return to
a_proc = Proc.new { return }

a_proc.call
# => localJumpError (unexpected return)

# If you return froma  proc inside a method, the method is the context in which it was called and therefore it returns from the method before any of ther other code below it is executed. 
def my_method
    a_proc = Proc.new { return }
    puts "this line will be printed"
    a_proc.call
    puts "this line is never reached"
  end
  
  my_method
  #=> this line will be printed


#  <-- Similarities -->
# Both procs nd lambdas support defualt arguments just like ruby methods
my_proc = Proc.new { |name="bob"| puts name }

my_proc.call
# => bob

my_lambda = ->(name="r2d2") { puts name }

my_lambda.call
# => r2d2

# Both procs and lambdas can be used as arguments to a method
def my_method(useful_arg)
    useful_arg.call
end
  
  my_lambda = -> { puts "lambda" }
  my_proc = Proc.new { puts "proc" }
  
  my_method(my_lambda)
  # => lambda
  
  my_method(my_proc)
  # => proc


#  <-- Capturing blocks -->
# Now that we know how procs and lambdas work, how can this be applied to blocks?

# Ruby allows us to capture blocks in a methods definition as a special argument using &
def cool_method(&my_block)
    my_block.call
  end
  
  cool_method { puts "cool" }

#   What happens to the code below is that #to_proc is called on the symbol :to_i. This returns a proc object which responds to the given method indicated by the symbol. So here, #map yields each value in the array to the proc object, which calls #to_i on it. 

arr = ["1", "2", "3"]

arr.map(&:to_i)
# => [1, 2, 3]

# the & can work in other ways too. You can append it to a proc object and it converts it to a block, and passes the block to the method beign called. 

# The example below, sort of ties procs/labmdas and yeild together. (Yeild waits for the block to be applied to the method, proc/lambdas are usedd to encapsulate a block to be used in a method) The & is important becuase without it, you'd be sending an unwanted parameter. The & converts/states that my_proc is a proc that can be apploed to the yielded method
def cool_method
    yield
end

my_proc = Proc.new { puts "party" }

cool_method(&my_proc)
# => party