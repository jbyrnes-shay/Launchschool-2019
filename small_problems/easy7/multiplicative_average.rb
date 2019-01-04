=begin
Write a method that takes an Array of integers as input, multiplies all the numbers together, 
divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. 
Assume the array is non-empty.

Examples:

show_multiplicative_average([3, 5])
The result is 7.500

show_multiplicative_average([6])
The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
The result is 28361.667

input: arrray
output: float rounded to 3 decimal places
rules:
3 decimal places for output
assume array is non-empty
result is product of all elements of array / number of elements in array
=end
def show_multiplicative_average(arr)
  result = arr.inject(&:*) / arr.size.to_f
  puts format('The result is %.3f', result)
  # alternatively
  # puts "The result is %0.3f" % result
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])
