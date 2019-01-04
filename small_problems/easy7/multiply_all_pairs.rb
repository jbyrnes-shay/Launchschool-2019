=begin

Write a method that takes two Array arguments in which each Array contains a list of numbers, 
and returns a new Array that contains the product of every pair of numbers that can be formed 
between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

Examples:

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]


input: 2 arrays of numbers
output:  array
rules:
result is array of nums which
contains the prouct of each pair of nums that 
can be formed betweent the elemss of the 2 arrays
sort the result by increasing value
model the problem:
instantiate result arrayre
for each num a in arr1, 
  iterate through each num b in arr2 
  push a * b to result  
sort result
=end

def multiply_all_pairs(arr1, arr2)
  result = []
  arr1.each do |num1|
    arr2.each do |num2|
      result << num1 * num2
    end
  end
  result.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]