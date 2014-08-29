class Item < ActiveRecord::Base
  validates :name, :presence => :true
  has_and_belongs_to_many :tags, -> { uniq }

  scope :untagged, -> { joins("LEFT OUTER JOIN items_tags ON items.id = items_tags.item_id").where("items_tags.item_id IS NULL") }

end

# old scope method for returning untagged items:

# def self.untagged
#   untagged_items = []
#   Item.all.each do |item|
#     if item.tags == []
#       untagged_items << item
#     end
#   end
#   untagged_items
# end


#activerecord syntax to return items with no tags:

# Item.joins("LEFT OUTER JOIN items_tags ON items.id = items_tags.item_id").where("items_tags.item_id IS NULL")


# psql command to return items with no tags:

# SELECT * FROM items LEFT OUTER JOIN items_tags ON items.id = items_tags.item_id WHERE items_tags.item_id IS NULL;