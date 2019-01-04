=begin

Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence 
for that Array. You may assume that the Array always contains at least one number.

Examples:

sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35



input: array of numbers
output: sum of the sums of each leading subsequence
rules: 
assume array contans at least 1 num and isnot empty
model the problem:
instantiate result variable
use iteration to accumalte a sum of the elements in the array
i.e, first iter 3, second iter 8, 3rd iter 10
on each iteration, add the accumulation to result
one var will accumlate 3 + 8 + 10
one var will accumulate 3 + 5 + 2
=end

def sum_of_sums(array)
  result = 0
  running_sum = 0
  array.each do |num|
    running_sum += num
    result += running_sum
  end
  result
end

test = [
  sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2), # -> (21)
  sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3), # -> (36)
  sum_of_sums([4]) == 4,
  sum_of_sums([1, 2, 3, 4, 5]) == 35
]

puts test


# alternatively

def sum_of_sums2(array)
  result = 0
  array.inject(0) do |sum, elem|
     test = sum + elem
     result += test
     test
  end
  result
end

  puts sum_of_sums2([3, 5, 2])