=begin

loan calculator
need loan amount, apr, loan duration
formula for monthly payment:
m = p * (j / (1 - (1 + j)**(-n)))

m is monthly payment
p is loan amount
j is monthly interest rate
n is loan duration in months

input:
loan amount in dollars (integer/float)
apr in percentage form (float, e.g 18.9%)
loan duration in months (integer)

output:
monthly payment in dollars and cents (float, e.g. $242.53)

model the problem:
take input from user to obtain:
loan amount
apr
loan duration in months

get monthly interest rate and put it in calculable form
APR / 100 / 12
=end

=begin
the following complicated this application
attempt to style or color the text, changing the style depending on function

particularly the decision as to whether to use a data structure to represent
the style options,
or to implement a separate function for each color or style was difficult.
either option encumbers the readability of the application somewhat

the decision to allow the option to include $, % or not, in combination with
option of
float, or integer as part of numeric input for apr and loan amount

this had ramifications for design of a single validate function to handle all
numeric style inputs

the decision to store all numeric style input in a hash

this was implemented with an eye on constructing a function which would mutate
the hash in a single call by changing
the string values derived from gets into integers or floats where appropriate
in a hash, this would allow a varuiable number of variable inputs to be
converted to
numeric values with 1 or a few lines (as far as readibility, depends on
how many inputs)
which was the aim (to construct such a function)

the decision to include a help function which is accessed by entering 'h'
instead of a valid numerical input

=end

BG_STYLE = { magenta: "\e[1;45m", yellow: "\e[1;30;103m", blue: "\e[44m",
             lred: "\e[101m", red: "\e[41m", lblue: "\e[104m",
             lgray: "\e[1;30;47m", white: "\e[1;30;107m", green: "\e[42m",
             lgreen: "\e[102m" }
FG_STYLE = { cyan: "\e[96m", lred: "\e[91m", magenta: "\e[35m", blue: "\e[34m",
             lgreen: "\e[92m", black: "\e[30m",
             lgray: "\e[37m" }
STYLE =    { reset: "\e[0m", italic: "\e[3m", bold: "\e[1m" }

def clear_screen
  (system 'cls') || (system 'clear')
end

def styled_line(line, style)
  style + line + STYLE[:reset]
end

def array?(obj)
  Array(obj) == obj
end

def put_line(object, style=nil)
  prefix = "=> "

  if array?(object)
    object.each do |string|
      string = styled_line(string, style) if style
      puts "#{prefix} #{string}"
    end
  elsif style
    puts "#{prefix} #{styled_line(object, style)}"
  else
    puts "#{prefix} #{object}"
  end
end

def show_input_prompt(term)
  style = FG_STYLE[:cyan]
  help_option = "['h' for help]"
  input_prompt =  case term
                  when :amount
                    "Enter a loan amount"
                  when :apr
                    "Enter an APR amount"
                  when :duration
                    "Enter loan duration in months"
                  end \
                  + " " + help_option
  put_line(input_prompt, style)
end

def make_equal_lengths!(lines)
  max = lines.max_by(&:size).size
  lines.map! do |x|
    x + ' ' * (max - x.size)
  end
end

def get_error_response(input)
  case input
  when :name
    "Please enter an alphabetical string".upcase
  when :amount
    ["Please enter a positive integer or float",
     "with or without '$', and",
     "with correct comma separation (for thousands)",
     "or with no comma separation"]
  when :apr
    ["Please enter a positive integer or float",
     "with or without '%'"]
  when :duration
    "Please enter a positive integer (whole months)".upcase
  end
end

def show_error_response(input)
  message = get_error_response(input)
  if array?(message)
    make_equal_lengths!(message)
  end
  error_style = BG_STYLE[:yellow] + STYLE[:italic]
  put_line(message, error_style)
end

def get_help(string, topic)
  return nil unless string.strip.downcase == 'h'
  case topic
  when :amount
    ["EXAMPLE- 15000, or $15000, or 15000.00, or $15000.59",
     "EXAMPLE- $45,253,243.45 or 10,411"]
  when :apr
    "EXAMPLE: 11.9%, or 10.95, or 15"
  when :duration
    "EXAMPLE: 36, or 48"
  end
end

def help_style_helper(object, help_style)
  if array?(object)
    make_equal_lengths!(object)
    size = object.max_by(&:size).size
    object.map! do |string|
      string.prepend(' ') << ' '
      "   #{styled_line(string, help_style + STYLE[:italic])}"
    end
  else
    size = object.size
    object.prepend(' ') << ' '
    object = ["   #{styled_line(object, help_style + STYLE[:italic])}"]
  end
  [object, size]
end

def show_help(object)
  help_style = BG_STYLE[:lblue]
  object, size = help_style_helper(object, help_style)
  border = " #{'-' * size} "

  lines = ["   #{styled_line(border, help_style + FG_STYLE[:lgray])}"] +
          object +
          ["   #{styled_line(border, help_style + FG_STYLE[:lgray])}"]
  puts lines
end

def name?(str)
  str =~ /[a-zA-Z]+/
end

def valid_term_format?(num_str, term)
  comma_separated_thousands = /\d{1,3}(\,\d{3})+/
  currency_exp = /^\$?(\d+|#{comma_separated_thousands})(\.\d{2})?$/
  case term
  when :amount
    num_str.strip =~ currency_exp
  when :apr
    num_str.strip =~ /^\d{1,2}\.?\d{1,2}\%?$/
  when :duration
    num_str.strip =~ /^\d+$/
  end
end

def float?(num_str)
  num_str =~ /^\d*\.{1}\d{1,2}$/
end

def integer?(num_str)
  num_str.to_i.to_s == num_str
end

def terms_string_values_to_nums!(terms)
  terms.each do |k, v|
    v.delete!('%$,')

    if float?(v)
      terms[k] = v.to_f
    elsif integer?(v)
      terms[k] = v.to_i
    end
  end
  terms
end

def monthly_payment(loan_amt, apr, loan_months)
  mthly_interest = apr.to_f / 100 / 12
  loan_amt * (mthly_interest / (1 - (1 + mthly_interest)**-loan_months))
end

def create_summary(amount, apr, duration)
  payment = monthly_payment(amount, apr, duration).round(2)
  ["Loan Amount : $#{amount}",
   "Your APR is : #{apr}%",
   "Duration is : #{duration} months",
   "YOUR MONTHLY PAYMENT:",
   "$#{payment}"]
end

def display_summary(lines)
  headline_style = STYLE[:italic] + BG_STYLE[:white]
  put_line("SUMMARY:\n", headline_style + FG_STYLE[:lred])

  make_equal_lengths!(lines)
  put_line(lines.select do |ln|
             ln.downcase.match(/(amount|apr|duration)/)
           end, BG_STYLE[:lgray])
  puts "--------------------------"
  put_line(lines.reject do |ln|
             ln.downcase.match(/(amount|apr|duration)/)
           end, headline_style)
end

def show_greeting
  clear_screen()
  put_line('Welcome to Mortgage Loan Calculator')
  puts
end


def again?
  puts
  put_line("Do you want to make another calculation? ('Y' for yes)")
  gets.chomp.downcase.start_with?('y')
end

def show_goodbye(name)
  puts
  puts
  put_line("Goodbye #{name}. Thank you for calculating")
end

def process_term_input(term, terms_hash)
  loop do
    puts
    show_input_prompt(term)
    terms_hash[term] = gets.chomp
    helped = get_help(terms_hash[term], term)
    show_help(helped) if helped

    break if valid_term_format?(terms_hash[term], term)
    show_error_response(term) unless helped
    puts
  end
end

show_greeting()

l

sleep(0.75)
loop do
  clear_screen()

  loop do 
    put_line('Please tell me your name')
    name = gets.chomp
    break if name?(name)
    show_error_response(:name)
  end
  input_terms = {}
  process_term_input(:amount, input_terms)
  process_term_input(:apr, input_terms)
  process_term_input(:duration, input_terms)

  amount, apr, duration = terms_string_values_to_nums!(input_terms).values
  summary = create_summary(amount, apr, duration)

  sleep(0.5)
  clear_screen()
  display_summary(summary)
  break unless again?()
end
show_goodbye(name)
