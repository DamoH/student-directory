@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9" # this will cause the program to terminate
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return"
  # get the first name
  name = STDIN.gets.chop
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "Please add the cohort month (just hit return if no cohort yet)"
    cohort = STDIN.gets.chomp
    # adding a default value
    cohort == "" ? cohort = "not decided on " : cohort = cohort.capitalize.intern
    build_array(name, cohort)
    # step 8; exercise 9... adding singular/plural "student(s)"
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    puts "Next student name please (or just hit return to end)"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # open the file for writing
  file = File.open(".gitignore/students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = ".gitignore/students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    build_array(name, cohort)
  end
  file.close
end

def build_array(name, cohort)
  @students <<  {name: name, cohort: cohort.to_sym}
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Step 8; exercise (print method using while loop)
def print_students_list
  count = 1
  while count < @students.count do
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(30)
      count += 1
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great student(s)"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  # return if filename.nil? # get out of the method if it isn't given
  if filename == nil # load default file if none given on start-up (step 14 ex.2)
    load_students
    return
  end
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
