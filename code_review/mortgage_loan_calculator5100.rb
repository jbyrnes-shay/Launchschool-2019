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
require 'yaml'
require 'pry'

MESSAGES = YAML.safe_load(File.open('messages.yml'))

def array?(obj)
  Array(obj) == obj
end

def hash?(obj)
  Hash.try_convert(obj)
end

def message(topic, subtopic = nil)
  message_content = if subtopic
                      MESSAGES[topic][subtopic]
                    else
                      MESSAGES[topic]
                    end
  message_content = message_content.values if hash?(message_content)
  message_content
end

GENERAL_STYLES = { reset: "\e[0m", italic: "\e[3m", bold: "\e[1m" }.freeze
BACKGROUND_STYLES = { yellow_bg: "\e[1;30;103m", lblue_bg: "\e[104m",
                      lgray_bg: "\e[1;30;47m", white_bg: "\e[1;30;107m" }.freeze
FOREGROUND_STYLES = { cyan_fg: "\e[96m", lred_fg: "\e[91m",
                      blue_fg: "\e[34m", lgray_fg: "\e[37m" }.freeze
ALL_STYLES = GENERAL_STYLES.merge(BACKGROUND_STYLES, FOREGROUND_STYLES).freeze

def styles(*styles)
  style_string = ''
  styles.each do |style|
    style_string << if String.try_convert(style)
                      style
                    else
                      ALL_STYLES[style]
                    end
  end
  style_string
end

def reset_style
  styles(:reset)
end

def clear_screen
  (system 'cls') || (system 'clear')
end

def styled_line(line, style)
  if style
    style + line + styles(:reset)
  else
    line + styles(:reset)
  end
end

def put_single_line(object, style = nil)
  prefix = '=> '
  puts "#{prefix} #{styled_line(object, style)}"
end

def put_array_lines(arr, style)
  lines = arr.map do |line|
    styled_line(line, style)
  end
  puts lines
end

def put_line(object, style = nil)
  prefix = '=>'
  if array?(object)
    object.map! { |elem| "#{prefix} #{elem}" }
    put_array_lines(object, style)
  else
    put_single_line(object, style)
  end
end

def show_loan_term_prompt(term)
  help_option = message('help', 'instruction')
  input_prompt =  case term
                  when :amount then message('input', 'amount')
                  when :apr then message('input', 'apr')
                  when :duration then message('input', 'duration')
                  end \
                  + ' ' + help_option
  put_line(input_prompt, styles(:cyan_fg))
end

def make_equal_lengths!(lines)
  max = lines.max_by(&:size).size
  lines.map! do |x|
    x + ' ' * (max - x.size)
  end
end

def get_error_response(input)
  case input
  when :name then message('error', 'name')
  when :amount then message('error', 'amount')
  when :apr then message('error', 'apr')
  when :duration then message('error', 'duration')
  end
end

def show_error_response(input)
  message = get_error_response(input)
  if array?(message)
    message.map! { |msg| "\u26AB #{msg}" }
    make_equal_lengths!(message)
  else
    message = "\u26AB #{message}"
  end
  error_style = styles(:yellow_bg, :italic)
  put_line(message, error_style)
end

def get_help(string, loan_term)
  return nil unless string.strip.casecmp('h').zero?

  case loan_term
  when :amount then message('help', 'amount')
  when :apr then message('help', 'apr')
  when :duration then message('help', 'duration')
  end
end

def style_help_content(object)
  help_style = styles(:lblue_bg, :bold, :italic)
  if array?(object)
    style_multi_line_help!(object, help_style)
  else
    [style_single_line_help!(object, help_style)]
  end
end

def style_multi_line_help!(arr, styles)
  make_equal_lengths!(arr)
  arr.map! do |string|
    string.prepend(' ') << ' '
    "   #{styled_line(string, styles)}"
  end
end

def style_single_line_help!(string, styles)
  string.prepend(' ') << ' '
  "   #{styled_line(string, styles)}"
end

def get_object_size(object)
  if array?(object)
    object.max_by(&:size).size
  else
    object.size
  end
end

def show_help(object)
  size = get_object_size(object)
  border = " #{'-' * size} "
  line = ["   #{styled_line(border, styles(:lblue_bg, :bold, :lgray_fg))}"]
  puts line + style_help_content(object) + line
end

def name?(str)
  str.strip =~ /^[a-zA-Z\s]+$/
end

def currency_expression
  comma_separated_thousands = /\d{1,3}(\,\d{3})+/
  /^\$?(\d+|#{comma_separated_thousands})(\.\d{2})?$/
end

def valid_loan_term_input?(num_str, term)
  num_str.strip!
  return false if num_str.delete('$,%').to_f.zero?

  case term
  when :amount
    num_str =~ currency_expression
  when :apr
    num_str =~ /^\d{1,2}\.?\d{1,2}\%?$/
  when :duration
    num_str =~ /^\d+$/
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

def create_summary_content(amount, apr, duration)
  payment = monthly_payment(amount, apr, duration).round(2)
  [format(message('summary', 'amount').to_s, amount: amount),
   format(message('summary', 'apr').to_s, apr: apr),
   format(message('summary', 'duration').to_s, duration: duration),
   message('summary', 'result'),
   payment.to_s]
end

def display_summary(lines)
  put_line("SUMMARY:\n", styles(:italic, :white_bg, :lred_fg))
  make_equal_lengths!(lines)
  put_line(lines.select do |ln|
             ln.downcase.match(/(amount|apr|duration)/)
           end, styles(:lgray_bg))
  puts '--------------------------'
  put_line(lines.reject do |ln|
             ln.downcase.match(/(amount|apr|duration)/)
           end, styles(:italic, :white_bg))
end

def loan_term_input_process(term, loan_terms)
  loop do
    show_loan_term_prompt(term)
    loan_terms[term] = gets.chomp
    helped = get_help(loan_terms[term], term)
    show_help(helped) if helped
    break if valid_loan_term_input?(loan_terms[term], term)

    show_error_response(term) unless helped
    puts
  end
end

clear_screen
put_line(message('welcome'))
puts
name = ''
loop do
  put_line(message('input', 'name'))
  name = gets.chomp
  break if name?(name)

  show_error_response(:name)
  puts
end
sleep(0.75)

loop do
  clear_screen
  loan_terms = {}
  puts
  loan_term_input_process(:amount, loan_terms)
  puts
  loan_term_input_process(:apr, loan_terms)
  puts
  loan_term_input_process(:duration, loan_terms)
  amount, apr, duration = terms_string_values_to_nums!(loan_terms).values
  summary = create_summary_content(amount, apr, duration)
  sleep(0.5)
  clear_screen
  display_summary(summary)
  play_again_answer = ''
  loop do
    puts
    put_line(message('play_again', 'question'))
    play_again_answer = gets.chomp
    break if play_again_answer.downcase.start_with?('y', 'n')

    put_line(message('play_again', 'answer_invalid'))
  end
  break if play_again_answer == 'n'
end
puts
puts
put_line(format(message('goodbye').to_s, name: name))
