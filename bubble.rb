class Bubble

  attr_accessor :username,
                :body,
                :created_at

  def initialize(attrs)
    @username = attrs[:username]
    @body = attrs[:body]
    @created_at = attrs[:created_at]
  end

  def created_at
    @created_at = Time.now
  end

end
