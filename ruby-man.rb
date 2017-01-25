#variables are created to use a variable more than once
@options = ['cd', 'mkdir', 'touch', 'vim', 'touch', 'pbcopy']

def main_menu
  puts '***** command line menu ***'
  puts '1: command line'
  puts '2: search man pages'
  puts '3: exit'

  case gets.chomp.to_i
  when 1
    command_choices
  when 2
    search
  when 3
    puts 'thanks for using the command line'
    exit(0)
  else
    error_message
    main_menu
  end
end

def command_choices
  # index = 1
  puts 'man commands options'
  @options.each_with_index do |option, index|
    puts "#{index + 1}. #{option}"
    # index += 1
  end

  choice = gets.chomp.to_i
  man_output(@options[choice -1])
end

def search
  puts 'enter a command for man page'
  man_output(gets.chomp)
end

def man_output(man_command)
  puts `man #{man_command}`
  main_menu
end

def error_message(message = nil)
  if message
    puts message
  else
    puts 'invalid choice please try again'
  end
end


main_menu

# also working code below
#user_choice = gets.chomp.to_i

#case user_choice
#  when 1
#    puts '** man commands **'
#    puts '1. cd'
#    puts '2. mkdir'
#    puts '3. touch'
#    command_choice = gets.chomp.to_i
#    case command_choice
#      when 1
#        puts `man cd`
#      when 2
#        puts `man mkdir`
#      when 3
#        puts `man touch`
#      else
#        puts 'invalid choice'
#    end
#  when 2
#    puts 'enter a command for a man page: '
#    search_term = gets.chomp
#    puts "the search term is: #{search_term}"
#    puts `man #{search_term}`
#  when 3
#    puts 'Thanks for using the command line menu'
#    exit(0)
#  else
#    puts 'invalid choice'
#end
