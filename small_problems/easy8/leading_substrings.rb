=begin

Write a method that returns a list of all substrings of a string that start at the 
beginning of the original string. 
The return value should be arranged in order from shortest to longest substring.

Examples:

substrings_at_start('abc') == ['a', 'ab', 'abc']
substrings_at_start('a') == ['a']
substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']



input: string
output: array
rules: arrange returned array in order from short to long substring
return all substrings that start at beginning of original string
model the problem:
instantiate a result array
and an accumulator string
iterate through each char
  shovel char to accumulator
  push accumulator to result
return result
=end

def substrings_at_start(string)
  result = []
  accum = ""
  string.chars.each do |char|
    accum += char 
    # note that this cannot be
    # << char, as then the result array
    # will be pointing to the same object
    # at each index, and each index will
    # have same value
    result << accum#.object_id
  end
  result
end


p substrings_at_start('abc')
p substrings_at_start('a')
p substrings_at_start('xyzzy')


#alternative

def substrings_at_start2(string)
  result = []
  0.upto(string.size - 1) do |i|
    result << string[0..i]
  end
  result
end

p substrings_at_start2('abc')
p substrings_at_start2('a')
p substrings_at_start2('xyzzy')