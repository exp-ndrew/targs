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
