=begin

Write a method that takes a single String argument and returns a new string that 
contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

Examples

word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
=end


def word_cap(string)
  string.split.map do |word|
    word[0].upcase + word[1..-1].downcase
  end.join(' ')
end


test = [
word_cap('four score and seven') == 'Four Score And Seven',
word_cap('the javaScript language') == 'The Javascript Language',
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


]

puts test