# Patterb matching uses specified patterns to match against some data. If the data conforms to the pattern, there is a match and the data is deconstructed accordingly. If there is no match, either you can supply a default value or return or else an error is raised. 

- 'Explain the syntax for implementing a pattern matching case statement'
#   Just like the case statement but uses 'in' instead of 'when'

- 'Explain what types can be used in pattern matching.'
# Boolean, nil, numbers, strings, symbols, arrays, hashes, ranges, regular expressions, proc

- 'Explain the possible return values from a pattern match'
# true or NoMatchingPatternError

- 'Explain how to implement a guard condition in a pattern match statement'
# we can attach an if or unless statement to add an additional condiiton when a pattern matches

- 'Explain how to pattern match against an array and arrays within arrays.'
# It's important to note that arrays match only the whole array.

- 'Explain how to pattern match wiht a hash'

- 'Explain the main differences between a hash and array pattern matching'

- 'Explain how to use the pin operator'
# used to match against a variable of that name

- 'Explain the use of alternative pattern'

- 'Explain how to bind matches to a variable'

- 'Explain how to match against your own custom classes'

#  <-- The Basics -->
# The most BASIC format for a pattern match is a case statement. Now, instead of 'when' we use 'in'. They are basicly the same thing

# Ruby case statement
grade = 'C'

case grade
when 'A' then puts 'Amazing effort'
when 'B' then puts 'Good work'
when 'C' then puts 'Well done'
when 'D' then puts 'Room for improvement'
else puts 'See me'
end

# => Well done

# Pattern matching  best used when there are multiple condiitonals you could possibly match against and need to check all of them.
grade = 'C'

case grade
in 'A' then puts 'Amazing effort'
in 'B' then puts 'Good work'
in 'C' then puts 'Well done'
in 'D' then puts 'Room for improvement'
else puts 'See me'
end

# => Well done

# The next format is a oneline syntax using the trusty hash rocket that will be familiar from hashes

# Best used when the data structure you are matching against is known.
login = { username: 'hornby', password: 'iliketrains' }

login => { username: username }

puts "Logged in with username #{username}"

#=> Logged in with username hornby

#  <-- Patterns -->
# There are multiple ways of potentially matching against an input. Patterns can be...
# Any ruby object which is matched using ===. The Object Pattern

# A variable capture / Variable pattern

# An as pattern

# An Alternative Pattern

# A Guard Condition

# An Array Pattern

# A Hash Pattern

#  <-- Return Values -->
# There are 2 possible return values from a pattern match (true/NoMatchingPatternError)

#  <-- Object Pattern Match -->
# Any object can be used in a pattern match. It's matched using === to compare two objects and is the same basis. 

# With the grade example, each item was compared with the grade like so 

'A' === 'A' #=> true

# Because of this we can also  check against data types
input = 3

case input
in String then puts 'input was of type String'
in Integer then puts 'input was of type Integer'
end

#=> input was of type Integer

# All of this is not much different from what we can do with a case/when statement, the power comes when we match these types within some of the other patterns as we'll see next

#  <-- Variable Pattern -->
# The variable pattern binds a variable or variables to the values that match the pattern

# here is the basic format (the example is not very useful but lays the foundation fro use in other patterns as we'll see.)
age = 15

case age
in a
  puts a
end

# => 15

# NOTE Something to take note of is that the variable pattern always binds the value to the variable so be careful if there is another variable with the same name in the outer scope which you’ll need.

a = 5

case 1
in a
  a
end

puts a
#=> 1

# To avoid this, we would use the pin operator which matches against the variable of that name

a = 5

case 1
in ^a
  :no_match
end

#=> NoMatchingPatternError

#  <-- As Pattern Match -->
# Similar to the variable pattern but can be used to manage more comlex assignments. Makes more snese when using arrays and hashes. General pattern below...

case 3
in 3 => a
    puts a
end
    
    # => 3


#  <-- Alternative Pattern Match -->
# This pattern allows us to check if multiple options match the input
case 0
    in 0 | 1 | 2
      puts :match
    end
    
    # => match

#  <-- Guard Conditions -->
# This is not a pattern per se but a way to make sure the pattern is only matched if the guard condition holds true. You can use any expression in the condition as long as it evaluates to either true or false.
some_other_value = true

case 0
in 0 if some_other_value
  puts :match
end

# => match

#  <-- Array Pattern Match -->
# At the most basic level, you van match against the exact elements in the array like so...
arr = [1 ,2]

case arr
in [1, 2] then puts :match
in [3, 4] then puts :no_match
end

# => match

# We can also match against the types of the array's elements
arr = [1, 2]

case arr
in [Integer, Integer]
  puts :match
in [String, String]
  puts :no_match
end

# => match

# What happens if we have more elements in the array? an error! Ruby only match against arrays with the same number of elements.

arr = [1, 2, 3]

case arr
in [Integer, Integer]
  puts :no_match
end

# => [1, 2, 3] (NoMatchingPatternError)

# What if you want to match against only part of an array? Use the * splat method

arr = [1, 2, 3]

case arr
in [Integer, Integer, *] #accepts all elements after the first 2 integers
  puts :match
end

# => match

# The splat can be placed anywhere in an array to match multiple entries

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

case arr
in [Integer, Integer, *, Integer, Integer] #the patter is matching the first 2 and last 2 arr elements
  puts :match
end

# => match

# You can also mix and match between checking actual values and types
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

case arr
in [Integer, Integer, *, 9, 10]
# checks if first 2 are integers and if last 2 are values 9 and 10
  puts :match
end

# => match

# If you want to scoop up the values of the array matched against the splat, you can use the varuable patterns

arr = [1, 2, 3, 4]

case arr
in [1, 2, *tail]
# assigns last 2 values of arr as the tail an p tail
  p tail
end

# => [3, 4]

# If you dont care about some values in the array and are happy tomatch against any value for that index you can use _

arr = [1, 2, 3, 4]

case arr
in [_, _, 3, 4]
  puts :match
end

# => match

# Lets say you want to match against an array of two numbers, but only if they arent the same number. You can use a guard clause

arr = [1, 2]
case arr
in [a, b] unless a == b
  puts :match
end

# => match

# You can even match against nested arrays
arr = [1, 2, [3, 4]]

case arr
in [_, _, [3, 4]]
  puts :match
end

# => match

# This is where the real power of pattern matching shines. Traversing deeply nested structures for matches. You can incorporate the variable pattern to bind matching values to variables to use later
arr = [1, 2, 3, 4, 5]

case arr
in [1, 2, 3, a, b]
  puts a
  puts b
end

# => 4
# => 5

# Let's say you have a nested array and you want to match against both the nested array, and some individual parts of it. This is where the as pattern can be used.
case [1, 2, 3, [4, 5]]
    in [1, 2, 3, [4, a] => arr]
      puts a
      p arr
    end
    
    # => 5
    # => [4, 5] 

# Also, when matching ana rray the [] are optional on the outer array

#  <-- Hash Pattern Matching -->
# Works very similarly to arrays with important differences. Only works for symbol keys, not string keys. You can match against parts of a hash without having to handle the fact there may be additional key;value pairs.

# we can match against the actual values of a hash
case { a: 'apple', b: 'banana' }
    in { a: 'aardvark', b: 'bat' }
      puts :no_match
    in { a: 'apple', b: 'banana' }
      puts :match
    end
    
    # => match

# we can match agaist a hash and assign values to variables
case { a: 'apple', b: 'banana' }
    in { a: a, b: b }
      puts a
      puts b
    end
    
    # => apple
    # => banana

# You cold write the same code above in a cleaner way because of ruby syntactic sugar
case { a: 'apple', b: 'banana' }
    in { a:, b: }
      puts a
      puts b
    end
    
    # => apple
    # => banana

# As with arrays, in Hashes, you can omit the brackets {} (to clean it up even more!)

case { a: 'apple', b: 'banana' }
    in a:, b:
      puts a
      puts b
    end
    
    # => apple
    # => banana

# You can use the double splay ** to scoop up multiple key;value pairs. NOTE! rest in the code below is the variable assigned to the last key;values of the hash
case { a: 'ant', b: 'ball', c: 'cat' }
    in { a: 'ant', **rest }
      p rest
    end
    
    # => { :b => "ball", :c => "cat" }

# NOTE! because a hash will only match with a subset of keys matching, you need to guard against situations where you dont want that behavior. 

# Notice how the order matters and the last pattern should match but becuase the first one matches before, the statement is exited.
case { a: 'ant', b: 'ball' }
    in { a: 'ant' }
      'this will match'
    in { a: 'ant', b: 'ball' }
      'this will never be reached'
    end

# To ensure you only match exactly you can use **nil
case { a: 'ant', b: 'ball' }
    in { a: 'ant', **nil }
      puts :no_match
    in { a: 'ant', b: 'ball' }
      puts :match
    end
    
    # => match

# We can use the as pattern to assign the entire hash match to a variable
case { a: 'ant', b: 'ball' }
    in { a: 'ant' } => hash
      p hash
    end
    
    #=> { :a => 'ant', :b => 'ball' }

# <-- Ruby 3 Patterns -->
# <-- Rightward Assignment -->
# Usually with ruby, you place cvariables on the left of an expression that binds the value to the variable. But with rightward assignment, you deconstruct an object and assign values to variables on the right of the expression. You do this with an => instead of an =. Just like with this examples we've seen previously 

login = { username: 'hornby', password: 'iliketrains' }

login => { username: username }

puts "Logged in with username #{username}"

#=> "Logged in with username hornby"

# <-- Find Pattern -->
# As we've seen earlier, we can match against a part of a hash but not an array using the array pattern match. 
# You place it with * on either side of the part you want to match. You can even use the variable patter to give each * a name for reference later.
case [1, 2, 3]
    in [*pre, 1, 2, 3, *post]
      p pre
      p post
    end
    
    # => []
    # => []

# Because everything was match between the pattern our pre and post variables were assigned empty arrays. Let's see what happens when they aren't
case [1, 2, 3, 4, 5]
    in [*pre, 2, 3, *post]
      p pre
      p post
    end
    
    # => [1]
    # => [4, 5]

# Let's say you have an array fo both string and integers and want to match on the first instance of two consecutive strings. 
    case [1, 2, "a", 4, "b", "c", 7, 8, 9]
        in [*pre, String => x, String => z, *post]
          p pre
          p x
          p z
          p post
        end
        
        # => [1, 2, "a", 4]
        # => "b"
        # => "c"
        # => [7, 8, 9]

        data = [
            {name: 'James', age: 50, first_language: 'english', job_title: 'general manager'},

            {name: 'Jill', age: 32, first_language: 'italian', job_title: 'leet coder'},

            {name: 'Helen', age: 24, first_language: 'dutch', job_title: 'biscuit quality control'},

            {name: 'Bob', age: 64, first_language: 'english', job_title: 'table tennis king'},

            {name: 'Betty', age: 55, first_language: 'spanish', job_title: 'pie maker'},
          ]

# Let's say you get a name, age, and job title as parameters and if that perosn exists, you need to return their first lnguage, otherwise nil. Before pattern matching you may do something like ...

name = 'Jill'
age = 32
job_title = 'leet coder'

match = data.find do |person|
  person[:name] == name && person[:age] == age && person[:job_title] == job_title
end

match&.fetch(:first_language)

# The code above is not too bad for fetching the data but it would not be very practical if there where multiple layers nested in out data. 

# Here is the exact functionality above but written with a pattern match

name = 'Jill'
age = 32
job_title = 'leet coder'

case data
in [*, { name: ^name, age: ^age, first_language: first_language, job_title: ^job_title }, *]
else
  first_language = nil
end

puts first_language

# => italian

# NOTE! WIth pattern matching, we de need to consider the case if there is no match, without the else clause we'd get the no matching pattern error. That is what the else clasue is for. 