=begin

Modify the method from the previous exercise so it ignores non-alphabetic characters

when determining whether it should uppercase or lowercase each letter.
The non-alphabetic characters should still be included in the return value; they 
just don't count when toggling the desired case.

Example:

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
=end
=begin
input string
output string
rules
toggle every other alpha char
model the problem:
new string
shovel toggled char

or shovel non-alpha

=end
def swap(string, count)
  result = if (count % 2).zero?
             string.upcase
           else
             string.downcase
           end
  result
end
def staggered_case(string)
  result= ''
  index = 0
  count = 0
  while  index < string.size 
    if string[index] =~ /[a-zA-Z]/
      result << swap(string[index], count)
      count += 1
    else
      result << string[index]
    end
    index += 1
  end
  result
end

p staggered_case('I Love Launch School!')# == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') #== 'AlL cApS'






































