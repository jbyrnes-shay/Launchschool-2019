=begin

Write a method that takes a floating point number that represents an angle 
between 0 and 360 degrees and returns a String that represents that angle in degrees, 
minutes and seconds. You should use a degree symbol (°) to represent degrees, 
a single quote (') to represent minutes, and a double quote (") to represent seconds. 
A degree has 60 minutes, while a minute has 60 seconds.





Examples:

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:

DEGREE = "\xC2\xB0"


input: a float between 0 and 360, representing an angle in degrees
output: a string representing that angle in degrees, minutes, and seconds
model the problem:
degree = 60 minutes
min = 60 seconds
=end
DEGREE = "\xC2\xB0"
def dms(degrees_float)
  degrees, rem = degrees_float.divmod(1) 
  minutes, rem = ((rem * 60).round(2)).divmod(1)  
  seconds = (rem * 60).round #% 60
  format("%d#{DEGREE}%02d\'%02d\"", degrees, minutes, seconds)
end


test = [
  dms(30) == %(30°00'00"),
dms(76.73) == %(76°43'48"),
dms(254.6) == %(254°36'00"),
dms(93.034773) == %(93°02'05"),
dms(0) == %(0°00'00"),
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
]

puts test