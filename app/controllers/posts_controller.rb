class PostsController < ApplicationController

def index
  @posts = Post.find(:all, limit: 10)
end

end
