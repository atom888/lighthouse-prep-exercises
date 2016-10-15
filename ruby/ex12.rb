#Prompting People for Numbers

print "Give me a number: "
number = gets.chomp.to_i

bigger = number * 100
puts "A bigger number is #{bigger}"

print "Give me another number: "
another = gets.chomp
number = another.to_i

smaller = number / 100
puts "A smaller number is #{smaller}."


#10% back
print "Give me money: "
money = gets.chomp.to_f

percent = money * 0.10
puts "10% is #{percent}"