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
    puts "Please add the cohort month (just hit return if no cohort yet)"
    cohort = gets.chomp
    # adding a default value
    cohort == "" ? cohort = "no cohort yet" : cohort = cohort.capitalize.intern
    puts "Please enter hobby (or 'none')"
    hobby = gets.chomp
    puts "Please enter country of birth"
    country = gets.chomp
    puts "Please enter height"
    height = gets.chomp
    students << {name: name, cohort: cohort, hobby: hobby, country: country, height: height}
    # step 8; exercise 9... adding singular/plural "student(s)"
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    puts "Next student name please (or just hit return to end)"
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

=begin
def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
=end

# Step 8; exercise (print method using while loop)
def print(students)
  count = 1
  while count < students.count do
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(30), "hobbies: #{student[:hobby]}".center(30), "country of birth: #{student[:country]}".center(30), "height: #{student[:height]}".center(30), ""
      count += 1
    end
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

def cohort_grouping(students)
  puts "Which cohort names would you like to see?"
  cohort = gets.chomp
  names = []
  students.map do |a_hash|
    a_hash.each do  |key, value|
      if value == cohort.capitalize.intern
        names.push(a_hash[:name])
      end
    end
  end
  puts names
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
# step 8; exercise 8
cohort_grouping(students)
