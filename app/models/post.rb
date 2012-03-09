class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  markdownize! :body
  
  def summary(length=300)
    rendered_body.gsub(/(<[^>]*>)|\n|\t/s," ")[0..length]
  end
  
  def published_at
    created_at.strftime("Published at %I:%M%p on %m/%d/%y")
  end
end
