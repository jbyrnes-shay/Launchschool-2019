
=begin

Write a method that takes a string as an argument and returns a new 
string in which every uppercase letter is replaced by its lowercase version, 
and every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

Example:

swapcase('CamelCase') == 'cAMELcASE
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'



input: string
output: string with uppercase swapped with lowercase and lowercase swapped with uppercase
model the problem:
loop through indicer
([x.lowercase, x.upcase] - [x]).first
this is a neat solution for cases where we are switching between 2 DIFFERENT values
(ie, we are sure the 2 values will always be different)
but is not a good solution for cases where there is a chance that the 2 values are the same
in that case the result Array-first called on the array subtraction expression will result in a nil value

or 
conditional
=end


def swapcase(string)
  length = string.size
  index = 0
  while index < length
    if string[index].upcase == string[index]
      string[index] = string[index].downcase
    else 
      string[index] = string[index].upcase
    end
    index += 1
  end
  string
end

#puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'