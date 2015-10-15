class Bubble

  attr_accessor :username,
                :body,
                :created_at,
                :posts_created_at
                :body_of_post
                :bubble_of_post

  def initialize(attrs)
    @username = attrs[:username]
    @body = attrs[:body]
    @created_at = attrs[:created_at]
    @posts_created_at = attrs[:posts_created_at]
    @body_of_post = attrs[:bubble_of_post]
    @bubble_of_post = attrs[:bubble_of_post]
  end

  def formatted_string
    "#{@username.capitalize} created a post \"#{@body}\" at #{@created_at}"
  end

  def write_file
    # File.open("/Users/tamarapop/Dropbox/SoapBox/#{@body}", 'w') do |file|
    File.open("/Users/tamarapop/code_builders/practice/trees/#{@body}", 'w') do |file|
      file << "#{@username.capitalize}"
    end
  end

  def posts_created_at
    @created_at = File.birthtime("#{@posts_created_at}")
  end

  def bubble_of_post
    @username = File.read("#{@body_of_post}")
    @body = File.basename("#{@bubble_of_post}")
  end

end
