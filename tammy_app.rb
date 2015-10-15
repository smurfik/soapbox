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
    created_at:  Time.now.strftime("%m-%e-%y %H:%M")
  }

  b = Bubble.new(answers)

  array_of_bubbles << b

  array_of_bubbles.each do |object|
    puts object.formatted_string
    object.write_file
  end
end

everything = Dir.glob("/Users/tamarapop/Dropbox/SoapBox/*")

everything.each do |element|
  the_file = File.open(element)
  answers = {
    username: the_file.read,
    body: File.basename(element),
    created_at: the_file.birthtime.strftime("%m-%e-%y %H:%M")
  }
  nb = Bubble.new(answers)
  puts nb.formatted_string
  the_file.close
end
