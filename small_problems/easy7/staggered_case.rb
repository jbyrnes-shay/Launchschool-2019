=begin

Write a method that takes a String as an argument, and returns a new String that contains the original 
value using a staggered capitalization scheme in which every other character is capitalized, 
and the remaining characters are lowercase. Characters that are not letters should not be changed, 
but count as characters when switching between upper and lowercase.

Example:

staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'


input String
output String
rules
starting with 1st char, 
every other letter char is capitalized
non letters should not be changed
but count as characters for switching index

=end

def staggered_case(string)
  index = 0
  while index < string.size
    if index % 2 == 0 
      string[index] = string[index].upcase 
    else
      string[index] = string[index].downcase
    end
    index += 1
  end
  string
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'