=begin

Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

Examples:

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'



input: String
output: String
rues:
words are sequence of non-blank characters
assume input will be at least 2 words
model the problem:
return the next to last word of the string argument
split the string
return index -2

=end

def penultimate(string)
  string.split[-2]
end


puts penultimate('last word')