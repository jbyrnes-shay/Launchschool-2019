=begin

Write a method that combines two Arrays passed in as arguments, 
and returns a new Array that contains all elements from both Array arguments, 
with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

Example:

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
=end

def interleave(arr1, arr2)
  index = 0
  result = []
  while index < arr1.length 
    result << arr1[index] << arr2[index]
    index += 1
  end
  result
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']