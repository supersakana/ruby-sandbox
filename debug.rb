# This is going to be a document for reviewing how to properly debug.

# 'Debugging - Is the act of tracing down a problem in code and fixing it'

# What is a stack trace? How can it be used to debug your code?
# 'A stack trace is printe when a runtime error occurs. Usually the first line provides the most useful information giving the line the error occured. This is helpful in targeting exactly where the issue needs to be fixed.'

# How can you use puts and pry to debug your code?
# 'using puts is the quickest way to see if your methods are returning an expected output. Printing out your values is key to degbugging'

# How should you decide to start with debugging?

# What is Pry?
# 'Pry is a ruby gem that provides you with an interactive REPL Prybybug adds step-by-step debugging and stack navigation'

require 'pry-byebug'

def yell_greeting(string)
  name = string

  binding.pry

  name = name.upcase
  greeting = "WASSAP, #{name}!"
  puts greeting
end

yell_greeting('bob')
