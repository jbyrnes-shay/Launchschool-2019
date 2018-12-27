=begin

Write a method that takes a positive integer, n, as an argument, 
and displays a right triangle whose sides each have n stars. 
The hypotenuse of the triangle (the diagonal side in the images below) 
should have one end at the lower-left of the triangle, and the other end at the upper-right.

Examples:

triangle(5)

    *
   **
  ***
 ****
*****

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********



problem:
height and width == num 
line1 spaces = num - 1
line2 spaces = num - 2
=end
def triangle(num)

  (1..num).each do |i|
    spaces = ' ' * (num - i)
    stars = '*' * i 
    puts spaces + stars
  end
  nil
end

puts triangle(5)
puts triangle(9)