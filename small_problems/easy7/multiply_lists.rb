=begin
Write a method that takes two Array arguments in which
each Array contains a list of numbers,
and returns a new Array that contains the product of each pair of numbers
from the arguments that have the same index.
You may assume that the arguments contain the same number of elements.

Examples:

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

input: 2 arrays of integersis
output: array of integers
rules:
output is single array containing product of each pair of nums having same index
assume args contain same number of elements
model the problem:
record size of arr1
iterate size times

use index on each iteration to get resulting element
push to new array
=end

def multiply_list(arr1, arr2)
  size = arr1.size
  result = []
  (0..size - 1).each do |i|
    result << arr1[i] * arr2[i]
  end
  result
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# alternative
def multiply_lists2(arr1, arr2)
  size = arr1.size
  (0..size - 1).each_with_object([]) { |i, result| result << arr1[i] * arr2[i] }
end

puts multiply_lists2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
