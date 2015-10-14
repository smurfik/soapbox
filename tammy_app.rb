require_relative 'bubble'

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
    created_at:  Time.now
  }

  b = Bubble.new(answers)

  array_of_bubbles.push(b)

  array_of_bubbles.each do |object|
    puts "#{object.username.capitalize} created a post \"#{object.body}\" at #{object.created_at}"
  end
end
