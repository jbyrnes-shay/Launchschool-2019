
=begin
sDelete vowels

Write a method that takes an array of strings, 
and returns an array of the same string values, 
except with the vowels (a, e, i, o, u) removed.

Example:

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']



input: array of strings 
output: array of same string values with vowels removed

model the problem:
map the array
delete('aeiou')

=end

def remove_vowels(arr)
  arr.map { |str| str.delete('aeiouAEIOU')}
end


test = [
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz),
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht),
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
]

puts test