class Bubble

  attr_accessor :username,
                :body,
                :created_at

  def initialize(attrs)
    @username = attrs[:username]
    @body = attrs[:body]
    @created_at = attrs[:created_at]
  end

  def formatted_string
    "#{@username.capitalize} created a post \"#{@body}\" at #{@created_at}"
  end

  def write_file
    File.open("/Users/tamarapop/Dropbox/SoapBox/#{@body}", 'w') do |file|
#     File.open("/Users/tamarapop/code_builders/practice/trees/#{@body}", 'w') do |file|
      file << "#{@username.capitalize}"
    end
  end

end
