require_relative 'bubble'
time_format = "%m-%e-%y %H:%M"
path_for_username = "/Users/tamarapop/code_builders/projects/soapbox/username"

the_name = ""

File.open(path_for_username) do |f|
  the_name = f.read
  puts "Welcome! If you're #{the_name.blue}, hit Y, otherwise type your username."
end

username = gets.chomp.downcase

until username == "exit" || username == "done"
  if username == "y"
    username = the_name
  else
    File.open(path_for_username, "w") do |f|
      f << username
    end
  end

  puts "Would you like to post, refresh, or exit?"
  body = gets.chomp.downcase

  break if body == "exit"
  if body == "post"
    puts "Write your message:"
    body = gets.chomp.downcase
    answers = {
      username:    username,
      body:        body,
      created_at:  Time.now.strftime(time_format)
    }

    b = Bubble.new(answers)
    b.write_file
    puts b.formatted_string
  else
    # all_files = Dir.glob("/Users/tamarapop/Dropbox/SoapBox/*")
    all_files = Dir.glob("/Users/tamarapop/code_builders/practice/trees/*")

    sorted_files = all_files.sort_by { |x| File.birthtime(x) }.reverse

    sorted_files.first(10).each do |element|
      File.open(element) do |the_file|
        answers = {
          username: the_file.read,
          body: File.basename(element),
          created_at: the_file.birthtime.strftime(time_format)
        }
        nb = Bubble.new(answers)
        puts nb.formatted_string
      end
    end
  end
end
