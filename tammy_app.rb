require_relative 'bubble'
time_format = "%m-%e-%y %H:%M"
puts "What is your username?"

username = gets.chomp.downcase

while true
  break if username == "exit" || username == "done"
  puts "What would you like to post? type exit or done to exit"
  body = gets.chomp
  break if body == "exit" || body == "done"

  answers = {
    username:    username,
    body:        body,
    created_at:  Time.now.strftime(time_format)
  }

  b = Bubble.new(answers)
  b.write_file

end

# everything = Dir.glob("/Users/tamarapop/Dropbox/SoapBox/*")
everything = Dir.glob("/Users/tamarapop/code_builders/practice/trees/*")
sorted_everything = everything.sort_by { |x| File.birthtime(x) }.reverse

sorted_everything.each do |element|
  the_file = File.open(element)
  answers = {
    username: the_file.read,
    body: File.basename(element),
    created_at: the_file.birthtime.strftime(time_format)
  }
  nb = Bubble.new(answers)
  puts nb.formatted_string
  the_file.close
end
