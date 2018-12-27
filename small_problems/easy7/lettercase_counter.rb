=begin
Write a method that takes a string, and then returns a hash that contains 3 entries:
 one represents the number of characters in the string that are lowercase letters, 
 one the number of characters that are uppercase letters, 
 and one the number of characters that are neither.

Examples

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

=end

def letter_case_count(string)
  hash = Hash.new(0)
  size = string.size 
  (0..size - 1).each do |elem|
    test = string[elem]
    case 
    when  test == test.upcase && test == test.downcase
      
      hash[:neither] += 1
    when test == test.downcase
      hash[:lowercase] += 1
    when test == test.upcase
      hash[:uppercase] += 1
    end
  end
  hash

end

test = [
letter_case_count('abCdef 123')#, #== { lowercase: 5, uppercase: 1, neither: 4 },
#letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 },
#letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 },
#letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

]

puts test
 