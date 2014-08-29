# new methods

def items_new
  puts "Enter the new item name:"
  item_name = gets.chomp
  Item.create({name: item_name})
  puts "New item named '#{item_name}' created!"
  wait
end

def tags_new
  puts "Enter the new tag name:"
  tag_name = gets.chomp
  new_tag = Tag.create({name: tag_name})
  puts "New tag named '#{new_tag.name}' created!"
  wait
end

# rename methods

def items_rename index
  ws
  item_to_rename = Item.all[index]
  if item_to_rename == nil
    error
    items_menu
  else
    puts "Enter a new name for #{item_to_rename.name}:"
    new_name = gets.chomp
    Item.all[index].update({:name => new_name})
    puts "Successfully renamed to #{new_name}!"
    wait
    items_menu
  end
end

def tags_rename index
  ws
  tag_to_rename = Tag.all[index]
  if tag_to_rename == nil
    error
    tags_menu
  else
    puts "Enter a new name for #{tag_to_rename.name}:"
    new_name = gets.chomp
    Tag.all[index].update({:name => new_name})
    puts "Successfully renamed to #{new_name}!"
    wait
    tags_menu
  end
end

# delete methods

def items_delete index
  ws
  item_to_delete = Item.all[index]
  if index == -1
    error
    items_menu
  elsif item_to_delete == nil
    error
    items_menu
  else
    puts "Are you sure you want to delete '#{item_to_delete.name}?' Y/n"
    confirm = gets.chomp
    case confirm
    when 'y'
      Item.all[index].destroy
      puts "Successfully deleted '#{item_to_delete.name}!'"
      wait
      items_menu
    when 'n'
      puts "Whew, that was close"
      wait
      items_menu
    else
      error
      items_menu
    end
  end
end

def tags_delete index
  ws
  tag_to_delete = Tag.all[index]
  if index == -1
    error
    tags_menu
  elsif tag_to_delete == nil
    error
    tags_menu
  else
    puts "Are you sure you want to delete '#{tag_to_delete.name}?' Y/n"
    confirm = gets.chomp
    case confirm
    when 'y'
      Tag.all[index].destroy
      puts "Successfully deleted '#{tag_to_delete.name}!'"
      wait
      tags_menu
    when 'n'
      puts "Whew, that was close"
      wait
      tags_menu
    else
      error
      tags_menu
    end
  end
end

# assign methods

def item_to_tag
  puts "Here are all the items in your collection:"
  Item.all.each_with_index do |item, index|
    puts "#{index+1}. #{item.name}"
  end
  ws
  puts "C > Cancel"
  puts "Enter the number of the item you would like to assign a tag to:"
  input = gets.chomp.downcase
  case input
  when /\d+/
    the_item = Item.all[(input.to_i)-1]
    ws
    puts "Assign a tag to '#{the_item.name}':"
    ws
    puts "Here are all the tags in your collection:"
    Tag.all.each_with_index do |tag, index|
      puts "#{index+1}. #{tag.name}"
    end
    ws
    puts "Enter the number of the tag you would like to assign to '#{the_item.name}'"
    input = gets.chomp
    the_tag_to_assign = Tag.all[(input.to_i)-1]
    the_item.tags << the_tag_to_assign
    puts "Successfully assigned '#{the_tag_to_assign.name}' to '#{the_item.name}!'"
    wait
    assign_menu
  when 'c'
    assign_menu
  else
    error
    assign_menu
  end

end

def tag_to_item
  puts "Here are all the tags in your collection:"

  Tag.all.each_with_index do |tag, index|
    puts "#{index+1}. #{tag.name}"
  end
  ws
  puts "C > Cancel"
  puts "Enter the number of the tag you would like to assign to an item:"
  input = gets.chomp.downcase
  case input
  when /\d+/
    the_tag = Tag.all[(input.to_i)-1]
    ws
    puts "Assign '#{the_tag.name}' to an item:"
    ws 
    puts "Here are all the items in your collection:"
    Item.all.each_with_index do |item, index|
      puts "#{index+1}. #{item.name}"
    end
    ws
    puts "Enter the number of the item you would like to assign '#{the_tag.name} to:"
    input = gets.chomp
    the_item_to_assign = Item.all[(input.to_i)-1]
    the_tag.items << the_item_to_assign
    puts "Successfully assigned '#{the_tag.name}' to '#{the_item_to_assign.name}!'"
    wait
    assign_menu
  when 'c'
    assign_menu
  else
    error
    assign_menu
  end

end
