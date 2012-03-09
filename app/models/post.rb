class Post < ActiveRecord::Base
  markdownize! :body
  
  def summary(lenght=300)
    rendered_body[0..300] + "..."
  end
end
