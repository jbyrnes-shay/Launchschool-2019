=begin

Write a method named include? that takes an Array and a search value as arguments. 
This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false




input: array, and integer
output: boolean
rules:
does array include integer
empty array does not include nil 

=end
def include?(arr, num)
  arr.each do |elem|
    return true if elem == num 
  end
  false
end


# closely examine why this does not work
# [].find(3) {|x| [].count(x) > 0}


test = [
include?([1,2,3,4,5], 3) == true,
include?([1,2,3,4,5], 6) == false,
include?([], 3) == false,
include?([nil], nil) == true,
include?([], nil) == false


]

puts test

#alternate
def include2?(arr, num)
  result = arr.find { arr.count(num) > 0 }
  !!result
end


test2 = [
include2?([1,2,3,4,5], 3) == true,
include2?([1,2,3,4,5], 6) == false,
include2?([], 3) == false,
include2?([nil], nil) == true,
include2?([], nil) == false


]
puts
puts test2