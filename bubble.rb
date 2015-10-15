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

end
