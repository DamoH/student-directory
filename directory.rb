def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "Please enter hobby (or 'none')"
    hobby = gets.chomp
    puts "Please enter country of birth"
    country = gets.chomp
    puts "Please enter height"
    height = gets.chomp
    students << {name: name, cohort: :november, hobby: hobby, country: country, height: height}
    puts "Now we have #{students.count} student(s)"
    # get another name from the user
    puts "Next student name please (or just hit return to end)"
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of my cohort of Villains Academy"
  puts "-------------"
end

=begin
def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
=end

# Step 8; exercise  (print method using while loop)
def print(students)
  count = 1
  while count < students.count do
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort), hobbies: #{student[:hobby]}, country of birth: #{student[:country]}, height: #{student[:height]}"
    end
    count += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student(s)"
end

def print_begin_letter(students, letter)
  students.each do |student|
    if student[:name].start_with?("#{letter}")
      puts "#{student[:name]} starts with '#{letter}'"
    end
  end
end

def print_shorter_than_12_chars(students)
  puts "Student(s) names that are less that 12 characters long:"
  students.each do |student|
    if student[:name].count("a-zA-z") < 12
      puts student[:name]
    end
  end
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
# Step 8; exercise 2
print_begin_letter(students, "D")
# Step 8; exercise 3
print_shorter_than_12_chars(students)
