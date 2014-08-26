require 'active_record'
require 'pg'
require './lib/item.rb'
require './lib/tag.rb'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["development"])

def main_menu
  system('clear')
  puts "Choose an option:"
  puts "1 > New Item"
  puts "2 > New Tag"
  puts "3 > List Items"
  puts "4 > List Tags"
  puts "X > Exit"

  menu_choice = gets.chomp.downcase

  case menu_choice
  when '1' then new_item
  when '2' then new_tag
  when '3' then list_items
  when '4' then list_tags
  when 'x'
    puts "Goodbye!"
    wait
    exit
  else
    error
    main_menu
  end
end

def new_item
  ws
  puts "Enter the new item name:"
  item_name = gets.chomp
  Item.create({name: item_name})
  puts "New item named '#{item_name}' created!"
  wait
  main_menu
end

def new_tag
  ws
  puts "Enter the new tag name:"
  tag_name = gets.chomp
  Tag.create({name: tag_name})
  puts "New tag named '#{tag_name}' created!"
  wait
  main_menu
end

def list_items
  ws
  puts "Here are all the items in your collection:"
  Item.all.each do |item|
    puts item.name
  end
  puts "Press any key to return to main menu"
  input = gets.chomp
  main_menu
end

def list_tags
  ws
  puts "Here are all the tags in your collection:"
  Tag.all.each do |tag|
    puts tag.name
  end
  puts "Press any key to return to main menu"
  input = gets.chomp
  main_menu
end

def error
  puts "That was not a valid response. Please press any key to continue."
  continue = gets.chomp
end

def wait
  sleep(1)
end

def ws
  puts "\n"
end

main_menu

