=begin

Write a method that returns a list of all substrings of a string. 
The returned list should be ordered by where in the string the substring begins. 
This means that all substrings that start at position 0 should come first, then all substrings that 
start at position 1, and so on. Since multiple substrings will occur at each position, 
the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the substrings_at_start method you wrote in the previous exercise:

Examples:

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]


input: string
output: array
model the problem:
this is all substraings, except doing a new iteration
on each subtring from index [1..-1], [2..-2], [3..-1],etc

=end
def substrings_at_start2(string)
  result = []
  0.upto(string.size - 1) do |i|
    result << string[0..i]
  end
  result
end

def substrings(string)
  result = []
  string.size.times do |i|
    result += substrings_at_start2(string[i..-1])
  end
  result
end
p substrings_at_start2('abcde')
p substrings('abcde')# 
