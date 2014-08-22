require 'active_record'
require 'rspec'
require 'tag'
require 'item'
require 'shoulda-matchers'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Item.all.each { |item| item.destroy }
    Tag.all.each { |tag| tag.destroy }
  end
end