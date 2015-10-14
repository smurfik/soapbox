require_relative 'bubble'

puts "What is your username?"
username = gets.chomp.downcase

puts "What would you like to post?"
body = gets.chomp

answers = {
  username: username,
  body: body,
}

b = Bubble.new(answers)
b.created_at.inspect

array_of_bubbles = [b]

puts array_of_bubbles.inspect
