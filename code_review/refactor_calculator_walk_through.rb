# as the user for two numbers
# ask the user for an operation to perfromzz
# perform the operation on the two numbers
# output the result

require('yaml')
# language options = EN, SP
LANG = 'EN'
MESSAGES = YAML.load(File.open('messages.yaml'))[LANG.upcase]

def clear_screen
  (system 'clr') || (system 'clear')
end

def prompt(string, num_lines=0)
  num_lines.times { puts } unless num_lines.zero?
  Kernel.puts("=> #{string}")
end

def number?(num)
  float?(num) || integer?(num)
  # alternatives
  # num.strip =~ /^(\d+|\d*\.{1}\d+)$/
end

def float?(num)
  num.to_f.to_s == num
  # alternatives
  # Float(num) rescue false
end

def integer?(num)
  num.to_i.to_s == num
  # alternatives
  # Integer(num) rescue false
end

def numstring_to_num(num_string)
  float?(num_string) ? num_string.to_f : num_string.to_i
end

def return_converted_nums(num1, num2)
  [num1, num2].map { |num| numstring_to_num(num) }
end

def valid_operator?(operator)
  %w[1 2 3 4].include?(operator)
end

def operation_to_message(operator)
  message = case operator
            when '1' then MESSAGES['operator']['adding']
            when '2' then MESSAGES['operator']['subtracting']
            when '3' then MESSAGES['operator']['multiplying']
            when '4' then MESSAGES['operator']['dividing']
            end
  message
end

num1 = ''
num2 = ''
operator = ''
name = ''
first_meet = true

clear_screen()

# prompt("Welcome to Calculator!  Enter your name:")
prompt(MESSAGES['welcome'])
loop do
  name = Kernel.gets().chomp()
  if name.empty?
    prompt(MESSAGES['get_name'])
  else break
  end
end

loop do
  clear_screen()

  prompt("Hi #{name}!") if first_meet
  first_meet = false

  loop do
    prompt(MESSAGES['get_num']['first'])

    num1 = Kernel.gets().chomp()

    if number?(num1)
      break
    else
      prompt(MESSAGES['validation']['number'])
    end
  end

  loop do
    prompt(MESSAGES['get_num']['second'])

    num2 = Kernel.gets().chomp()

    if number?(num2)
      break
    else
      prompt(MESSAGES['validation'['number']])
    end
  end

  operator_prompt = <<~MSG
    #{MESSAGES['operator']['which']}
    1) #{MESSAGES['operator']['add']}
    2) #{MESSAGES['operator']['subtract']}
    3) #{MESSAGES['operator']['multiply']}
    4) #{MESSAGES['operator']['divide']}
  MSG

  prompt(operator_prompt)

  loop do
    operator = Kernel.gets().chomp()
    if valid_operator?(operator)
      break
    else
      prompt(MESSAGES['validation']['operator'])
    end
  end

  prompt("#{operation_to_message(operator)} #{MESSAGES['calculating']} ...", 1)

  sleep(0.5)

  num1, num2 = return_converted_nums(num1, num2)

  result =  case operator
            when '1' then num1 + num2
            when '2' then num1 - num2
            when '3' then num1 * num2
            when '4' then num1.to_f() / num2.to_f()
            end

  prompt("#{MESSAGES['result']}: #{result}")

  prompt(MESSAGES['another_calculation'].to_s, 1)

  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt(MESSAGES['thanks'], 1)
