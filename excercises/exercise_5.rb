def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  
  while !name.empty? do
    puts "Where was this student born?"
    country_of_birth = gets.chomp
    puts "What is this students hobby?"
    hobby = gets.chomp
    students << {name: name, cohort: :november, country_of_birth: country_of_birth, hobby: hobby}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort), they were born in #{student[:country_of_birth]} and they enjoy #{student[:hobby]}"
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

