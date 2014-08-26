
require './ui_helper.rb'
require './ui_methods.rb'


def main_menu
  c
  puts "Choose an option:"
  puts "1 > New Item"
  puts "2 > New Tag"
  puts "3 > Modify Items"
  puts "4 > Modify Tags"
  puts "X > Exit"

  menu_choice = gets.chomp.downcase

  case menu_choice
  when '1' then
    items_new
    main_menu
  when '2'
    tags_new
    main_menu
  when '3' then items_menu
  when '4' then tags_menu
  when 'x'
    puts "Goodbye!"
    wait
    exit
  else
    error
    main_menu
  end
end


def items_menu
  c
  puts "Here are all the items in your collection:"
  Item.all.each_with_index do |item, index|
    puts "#{index+1}. #{item.name}"
  end
  ws
  puts "N > New Item"
  puts "E > Edit a Item name"
  puts "D > Delete a Item"
  puts "R > Return to main menu"
  input = gets.chomp.downcase
  case input
  when 'n'
    items_new
    items_menu
  when 'd'
    ws
    puts "Enter the number of the item to delete, or press 'c' to cancel"
    input = gets.chomp
    case input
    when 'c' then items_menu
    when /\d*/
      items_delete((input.to_i)-1)
    end
  when 'e'
    ws
    puts "Enter the number of the item to rename, or press 'c' to cancel"
    input = gets.chomp
    case input
    when 'c' then items_menu
    when /\d*/
      items_rename((input.to_i)-1)
    else
      error
      items_menu
    end
  end
  main_menu
end

def tags_menu
  c
  puts "Here are all the tags in your collection:"

  Tag.all.each_with_index do |tag, index|
    puts "#{index+1}. #{tag.name}"
  end

  ws
  puts "N > New Tag"
  puts "E > Edit a Tag name"
  puts "D > Delete a Tag"
  puts "R > Return to main menu"

  input = gets.chomp.downcase

  case input
  when 'n'
    tags_new
    tags_menu
  when 'd'
    ws
    puts "Enter the number of the tag to delete, or press 'c' to cancel"
    input = gets.chomp
    case input
    when 'c' then tags_menu
    when /\d*/
      tags_delete((input.to_i)-1)
    end
  when 'e'
    ws
    puts "Enter the number of the tag to rename, or press 'c' to cancel"
    input = gets.chomp
    case input
    when 'c' then tags_menu
    when /\d*/
      tags_rename((input.to_i)-1)
    else
      error
      tags_menu
    end
  end
  main_menu
end





main_menu

