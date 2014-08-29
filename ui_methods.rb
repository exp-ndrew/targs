# check_if_exists validation methods

def check_if_item_exists index
  if Item.all[index] != nil
    result = true
  else
    result = false
  end
  result
end

def check_if_tag_exists index
  if Tag.all[index] != nil
    result = true
  else
    result = false
  end
  result
end

# new methods

def items_new
  ws
  puts "Enter the new item name:"
  item_name = gets.chomp
  Item.create({name: item_name})
  puts "New item named '#{item_name}' created!"
  wait
end

def tags_new
  ws
  puts "Enter the new tag name:"
  tag_name = gets.chomp
  new_tag = Tag.create({name: tag_name})
  puts "New tag named '#{new_tag.name}' created!"
  wait
end

# view methods

def view_item index
  ws
  if check_if_item_exists(index)
    the_item = Item.all[index]
    puts "Viewing '#{the_item.name}'"
    ws
    if the_item.tags.length != 0
      puts "Tags:"
      the_item.tags.each_with_index do |tag, i|
        puts "#{i+1}. #{tag.name}"
      end
    else
      puts "No tags."
    end
    ws
    puts "R > Remove a tag from #{the_item.name}"
    puts "Press any key other to return"
    input = gets.chomp.downcase
    case input
    when 'r'
      tag_from_item(the_item)
    else
      puts ws
    end
  else
    error
  end
end

def view_tag index
  ws
  if check_if_tag_exists(index)
    the_tag = Tag.all[index]
    puts "Items with the tag '#{the_tag.name}'"
    ws
    if the_tag.items.length != 0
      the_tag.items.each_with_index do |item, i|
        puts "#{i+1}. #{item.name}"
      end
    else
      puts "None"
    end
    ws
    puts "R > Remove an item from #{the_tag.name}"
    puts "Press any other key to return"
    input = gets.chomp.downcase
    case input
    when 'r'
      item_from_tag(the_tag)
    else
      puts ws
    end
  else
    error
  end
end

# rename methods

def items_rename index
  ws
  if check_if_item_exists(index)
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
  else
    error
  end
end

def tags_rename index
  ws
  if check_if_tag_exists(index)
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
  else
    error
  end
end

# delete methods

def items_delete index
  ws
  if check_if_item_exists(index)
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
  else
    error
  end
end

def tags_delete index
  ws
  if check_if_tag_exists(index)
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
  else
    error
  end
end

# assign methods

def item_to_tag
  # puts "Here are all the items in your collection:"
  # Item.all.each_with_index do |item, index|
  #   puts "#{index+1}. #{item.name}"
  # end
  ws
  puts "C > Cancel"
  puts "Enter the number of the item you would like to assign a tag to:"
  input = gets.chomp.downcase
  case input
  when /\d+/
    if check_if_item_exists((input.to_i)-1) 
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
      items_menu
    else
      error
    end
  when 'c'
    items_menu
  else
    error
    items_menu
  end
end

def tag_to_item
  # puts "Here are all the tags in your collection:"

  # Tag.all.each_with_index do |tag, index|
  #   puts "#{index+1}. #{tag.name}"
  # end
  ws
  puts "C > Cancel"
  puts "Enter the number of the tag you would like to assign to an item:"
  input = gets.chomp.downcase
  case input
  when /\d+/
    if check_if_tag_exists((input.to_i)-1)
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
      tags_menu
    else
      error
    end
  when 'c'
    tags_menu
  else
    error
    tags_menu
  end

end

# deassign methods

def item_from_tag the_tag
  ws
  puts "Enter the number of the item to remove a tag from:"
  input = gets.chomp
  case input
  when /\d+/
    if the_tag.items[((input.to_i)-1)] != nil
      the_item = the_tag.items.find(the_tag.items[(input.to_i)-1].id)
      the_tag.items.delete(the_item)
      puts "Successfully removed the tag '#{the_tag.name}' from '#{the_item.name}'."
      wait
    else
      error
    end
  else 
    error
  end
end

def tag_from_item the_item
  ws
  puts "Enter the number of the tag to remove:"
  input = gets.chomp
  case input
  when /\d+/
    if the_item.tags[((input.to_i)-1)] != nil
      the_tag = the_item.tags.find(the_item.tags[(input.to_i)-1].id)
      the_item.tags.delete(the_tag)
      puts "Successfully removed the tag '#{the_tag.name}' from '#{the_item.name}'."
      wait
    else
      error
    end
  else
    error
  end
end

