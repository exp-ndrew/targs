require 'active_record'
require 'pg'
require './lib/item.rb'
require './lib/tag.rb'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["development"])


def c
  system('clear')
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
