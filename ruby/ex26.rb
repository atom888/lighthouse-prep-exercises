#Correcting Others Code


module Ex25

  # This function will break up words for us.
  def Ex25.break_words(stuff)  #missing closing bracket, break spelt wrong
    words = stuff.split(' ')
    return words #missing 's' on words
  end

  # Sorts the words.
  def Ex25.sort_words(words) #missing underscore between sort and words
    return words.sort
  end

  # Prints the first word after popping it off.
  def Ex25.print_first_word(words) #included 'e' for def
    word = words.pop  # removed (1) from pop
    puts words # added 'ds'
  end

  # Prints the last word after popping it off.
  def Ex25.print_last_word(words) #corrected function - replaced : with .
    word = words.pop
    puts words #added 's'
  end

  # Takes in a full sentence and returns the sorted words.
  def Ex25.sort_sentence(sentence)
    words = Ex25.break_words(sentence)
    return Ex25.sort_words(words)
  end # corrected 'end'

  # Prints the first and last words of the sentence.
  def Ex25.print_first_and_last(sentence) #added closing bracket
    words = Ex25.break_words(sentence) #corrected spelling - sentence
    Ex25.print_first_word(words) #corrected spelling - word, and added 's'
    Ex25.print_last_word(words)
  end

  # Sorts the words then prints the first and last one.
  def Ex25.print_first_and_last_sorted(sentence)
    words = Ex25.sort_sentence(sentence)
    Ex25.print_first_word(words) # corrected spelling of first
    Ex25.print_last_word(words)
  end

end



puts "Let's practice everything."
puts 'You\'d need to know \'bout escapes with \\ that do \n newlines and \t tabs.'

poem = <<END
\tThe lovely world
with logic so firmly planted
cannot discern \n the needs of love
nor comprehend passion from intuition
and requires an explanation
\n\t\twhere there is none.

END

puts "--------------"
puts poem
puts "--------------"


five = 10 - 2 + 3 - 6
puts "This should be five: #{five}"

def secret_formula(started)
  jelly_beans = started * 500
  jars = jelly_beans / 1000
  crates = jars / 100
  return jelly_beans, jars, crates
end


start_point = 10000
beans, jars, crates = secret_formula(start_point)

puts "With a starting point of: #{start_point}"
puts "We'd have #{beans} beans, #{jars} jars, and #{crates} crates."

start_point = start_point / 10



=begin
sentence = "All good things come to those who wait."
words = Ex25.break_words(sentence)
sorted_words = Ex25.sort_words(words)
Ex25.print_first_word(words)
Ex25.print_last_word words)
Ex25.print_first_word(sorted_words)
Ex25.print_last_word(sorted_words)
sorted_words = Ex25.sort_sentence(sentence)
Ex25.print_first_and_last(sentence)
Ex25.print_first_and_last_sorted(sentence)
=end
