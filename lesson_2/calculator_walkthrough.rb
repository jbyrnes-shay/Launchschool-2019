# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the resultK

Kernel.puts("Welcome to Calculator")

Kernel.puts("what's the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("what's the second number")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

number1 = number1.to_i
number2 = number2.to_i
result =  case operator
          when '1' then number1 + number2
          when '2' then number1 - number2
          when '3' then number1 * number2
          when '4' then number1 / number2.to_f


