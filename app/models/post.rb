class Post < ActiveRecord::Base
  markdownize! :body
end
