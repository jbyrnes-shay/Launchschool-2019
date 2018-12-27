You are given a method named spin_me that takes a string as an argument 
and returns a string that contains the same words, 
but with each word's characters reversed. 
Given the method's implementation, will the returned string be the same object 
as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"




ANSWER:

the returned string will be a different object

EXPLAIN:
the String-split method creates a new object, an array, from the calling string 
each is called on that method, the return value of the each block is the original str.split 

calling String-join on this new array str.split returns a new string


