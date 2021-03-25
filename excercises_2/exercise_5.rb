@students = []

def print_menu 
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Choose a list to load"
  puts "9. Exit"  
end

def process(selection)
  case selection 
    when "1"
      input_students
    when "2"
      print_students_list
    when "3"
      save_students
      puts "Students saved"
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def create_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  puts "What cohort are you part of?"
  cohort = ""
  cohort = STDIN.gets.chomp
  while !name.empty? do
    create_student(name, cohort)
    puts "Now we have #{@students.count} students"
    puts "Name?"
    name = STDIN.gets.chomp
    puts "Cohort?"
    cohort = STDIN.gets.chomp
  end
end

def print_students_list
  puts "The students of Villains Academy"
  puts "-------------"
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Choose a filename"
  selection = STDIN.gets.chomp
  file = File.open(selection, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  puts "Choose a filename"
  selection = STDIN.gets.chomp
  filename = selection unless !File.exists?(selection)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    create_student(name, cohort)
  end
  puts "Loaded #{@students.count} from #{filename}"
  file.close
end

def try_load_students
  filename = "students.csv"
  filename = ARGV.first unless ARGV.first.nil?
  load_students(filename) if File.exists?(filename)
end

try_load_students
interactive_menu

