require_relative 'bubble'
time_format = "%m-%e-%y %H:%M"
puts "What is your username? type exit or done to see the feed"

username = gets.chomp.downcase

while true
  break if username == "exit" || username == "done"
  puts "What would you like to post? type exit or done to see the feed"
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

# all_files = Dir.glob("/Users/tamarapop/Dropbox/SoapBox/*")
all_files = Dir.glob("/Users/tamarapop/code_builders/practice/trees/*")

sorted_files = all_files.sort_by { |x| File.birthtime(x) }.reverse


sorted_files.first(10).each do |element|
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

while true
  puts "Would you like to post, refresh, or exit?"
  answer = gets.chomp.downcase
  break if answer == "exit"

  if answer == "post"

  elsif answer == "refresh"

  else
    puts "Could you repeat that?"
  end
end
