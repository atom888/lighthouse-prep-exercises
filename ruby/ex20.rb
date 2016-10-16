# Functions and Files

#Takes file and saves as ARGV
input_file = ARGV.first


# file is saved as 'f' - '.read' displays text within the file
def print_all(f)
  puts f.read
end
#'.seek' moves to the start of the file
def rewind(f)
  f.seek(0)
end

#Counts how many lines there are in the file - removes /n from each line
def print_a_line(line_count, f)
  puts "#{line_count}, #{f.gets.chomp}"
end

current_file = open(input_file)

puts "First let's print the whole file:\n"
print_all(current_file)

puts "Now let's rewind, kind of like a tape."
rewind(current_file)

puts "Let's print three lines:"

current_line = 1
print_a_line(current_line, current_file)

current_line += 1
print_a_line(current_line, current_file)

current_line += 1
print_a_line(current_line, current_file)