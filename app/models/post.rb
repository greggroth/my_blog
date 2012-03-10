class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  attr_accessible :tag_tokens, :title, :body
  attr_reader :tag_tokens
  
  validates_presence_of :title, :body
  markdownize! :body
  
  def summary(length=300)
    rendered_body.gsub(/(<[^>]*>)|\n|\t/s," ")[0..length]
  end
  
  def published_at
    created_at.strftime("Published at %I:%M%p on %m/%d/%y")
  end
  
  def tag_tokens=(ids)
    self.tag_ids = ids.split(",").map(&:to_i)
  end
  
  def tag_tokens
    tag_ids
  end
end
