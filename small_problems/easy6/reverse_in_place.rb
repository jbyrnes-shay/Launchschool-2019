=begin
Write a method that takes an Array as an argument, and reverses its elements in place; 
that is, mutate the Array passed into this method. 

The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Examples:

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
list == ["abc"]

list = []
reverse!(list) # => []
list == []


input: an Array
output: the SAME array object with its elements reversed
rules: 
empty list returns empty list
single element list returns single element
only iterate through half the list, use array indices

last = -1
=end

def reverse!(list)
  last = -1
  half = list.size / 2
  half.times do |i|
    list[i], list[last] = list[last], list[i]
    last -= 1
  end
  list

end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!(list) # => []
p list == []

puts

# alterbate
def reverse2!(list)
  size = list.size
  half = size / 2
  half.times do |i|
    current_last = size - 1 - i
    list[i], list[current_last] = list[current_last], list[i]
  end
  list
end

list = [1,2,3,4]
result = reverse2!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = []
result = reverse2!(list)

p list 