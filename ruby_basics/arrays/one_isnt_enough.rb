=begin

Using the code below, select 'dog' from pets, 
add the return value to my_pets, then print the value of my_pets.

pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop

Expected output:

I have a pet fish and a pet dog!
=end

pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop


pet = pets[1]

my_pets.push(pet)

puts "I have a #{my_pets[0]} and a #{my_pets[1]}"



