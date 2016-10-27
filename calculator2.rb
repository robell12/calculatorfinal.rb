@arr = []
@memry = []

def name_input
	puts "What is your name?"
	@name = gets.strip
end

name_input

def calc_menu
	puts "\n---Welcome to Calculator---"
	puts "1) Use Calculator"
	puts "2) Calculator History"
	puts "3) Quit"
	puts "What do you want to do #{@name}\n"
	@choice = gets.strip.downcase
end

calc_menu

def operation_of_num
	puts "\nWhat is the first number of your calculation?"
	@number_one = gets.strip.to_f
	puts "\nWhat operation do you want (+, -, *, /)"
	@operator_one = gets.strip
	if @operator_one == "+" || @operator_one == "-" || @operator_one == "*" || @operator_one == "/" || @operator_one == "%"
	else operation_of_num
		puts "Sorry that wasn't a symbol."
	end
	puts "\nWhat is the second number of your calculation?\n"
	@number_two = gets.strip.to_f
	calculation
end


def calcu_history
	@arr.each_with_index do |op, i|
    puts if i % 4 == 0
    print " = " if i % 3 == 0
    print "#{op} "
	end
	puts "\n1) Make another calculation?"
	puts "2) Go back to main menu?\n"
	third_choice = gets.strip.downcase
	case third_choice
    when "1", "make another calculation", "make", "calculation", "another"
 	    operation_of_num
    else
 	   calc_menu
  end
end


def calculation
	case @operator_one
	when "+"
		@answer = @number_one + @number_two  
		answer
	when "-"
		@answer = @number_one - @number_two  
		answer
	when "*"
		@answer = @number_one * @number_two  
		answer
	when "/"
		@answer = @number_one / @number_two  
		answer
	end
end

def answer
	puts "\nThe answer is: #{@number_one} #{@operator_one} #{@number_two} = #{@answer}\n"
	@memry.push(@answer)
	@arr.push(@number_one, @operator_one, @number_two, @answer)
	extra_choices
end

def extra_choices
	puts "\n1) Make another calculation?"
	puts "2) Calculator history"
	puts "3) Do more to last answer?"
	puts "4) Go back to main menu?\n"
	other_choice = gets.strip.downcase
	case other_choice
    when "1", "make another calculation", "make", "calculation", "another"
 	    operation_of_num
    when "2" , "calculator", "calculator history"
 	    calcu_history
 	  when "3"
      memory_bank
    else
 	   calc_menu
  end
 end

def memory_bank
	puts @memry[0]
	puts "\nWhat do you want to do to this number?(+, -, *, /)"
	sign_thing = gets.strip
	puts "What is your second number?"
	next_number = gets.strip.to_f
		case sign_thing
		when "+"
			real_answer = @memry[0] + next_number
		when "-"
			real_answer = @memry[0] - next_number
		when "*"
			real_answer = @memry[0] * next_number
		when "/"
			real_answer = @memry[0] / next_number
		else
			puts "Please put a sign"
		memory_bank
		end
	puts "#{@memry[0]} #{sign_thing} #{next_number} = #{real_answer}"
	@memry << real_answer
	@arr.push(@memry[0], sign_thing, next_number, real_answer)
	extra_choices
end

def memry_operation

end

case @choice
when "1" , "use", "calculator"
	operation_of_num
when "2" , "calculator", "calculator history"
	calcu_history
when "3", "quit", "q"
	puts "You successfully quit!"
	exit
else 
	puts "please chose and option"
	calc_menu
end

while true
	@choice
end