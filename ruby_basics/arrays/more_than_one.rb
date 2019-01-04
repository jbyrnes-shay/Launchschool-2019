=begin

n the code below, an array containing different types of pets is assigned to pets.

pets = ['cat', 'dog', 'fish', 'lizard']

Select 'fish' and 'lizard' from pets at the same time, assign the return value to a variable named my_pets, then print the value of my_pets.

Expected output:

I have a pet fish and a pet lizard!

=end

pets = ['cat', 'dog', 'fish', 'lizard']

my_pets = pets[2..-1]

puts "I have a pet #{my_pets.first} and a pet #{my_pets.last}"