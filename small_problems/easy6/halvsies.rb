=begin
Halvsies

Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays)
 that contain the first half and second half of the original Array, respectively. 
 If the original array contains an odd number of elements, the middle element should be placed in the first half Array.


Examples:

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

=end

def halvsies(array)
  length = array.size
  int_half = length / 2
  count_with_mid = length - int_half 
  [array[0, count_with_mid], array[count_with_mid..-1]]
end

test = [
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]],
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]],
halvsies([5]) == [[5], []],
halvsies([]) == [[], []]

]

puts test