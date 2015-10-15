require_relative 'bubble'
require "colorize"

puts "What is your username?"
username = gets.chomp.downcase

array_of_bubbles = []

while true
  puts "What would you like to post? type exit or done to exit"
  body = gets.chomp
  break if body == "exit" || body == "done"

  answers = {
    username:    username,
    body:        body,
    created_at:  Time.now.strftime("%m/%d/%Y")
  }

  b = Bubble.new(answers)

  array_of_bubbles << b

  array_of_bubbles.each do |object|
    puts object.formatted_string
    object.write_file
  end
end
