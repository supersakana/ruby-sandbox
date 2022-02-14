def check_in(string)
 string.downcase.include? "lab"
end

puts check_in("laboratory")
puts check_in("experiment")
puts check_in("Pans Labyrinth")
puts check_in("elaborate")
puts check_in("polar bear")