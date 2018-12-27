=begin
Reversed Arrays (Part 2)

Write a method that takes an Array, and returns 
a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

Examples:

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b c d e)) == %w(e d c b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
list.object_id != new_list.object_id  # => true
list == [1, 2, 3]                     # => true
new_list == [3, 2, 1]                 # => true


input: Array
ouput: new array with array elements in reverse order 
rules:
empty array = []
single elem array = same single elem in array
=end

def reverse(array)
  result = []
  array.each do |elem|
    result.unshift(elem)
  end
  result
end


test = [
 reverse([1,2,3,4]) == [4,3,2,1] ,        # => true
reverse(%w(a b c d e)) == %w(e d c b a),  # => true
reverse(['abc']) == ['abc'] ,             # => true
reverse([]) == []                        # => true


]

puts test