class PostsController < ApplicationController

def index
  @posts = Post.find(:all, limit: 10)
end

def show
  @post = Post.find(params[:id])
end

def edit
  @post = Post.find(params[:id])
end

def new
  @post = Post.create
end

def create
  @post = Post.find(params[:id])
  
  respond_to do |format|
    if @post.save
      format.html { redirect_to posts_path, notice: "Post created" }
    else
      format.html { render action: :edit, notice: "Try again" }
    end
  end
end

def update
  @post = Post.find(params[:id])
  
  respond_to do |format|
    if @post.update_attributes(params[:post])
      format.html { redirect_to posts_path, :notice => "Post upated" }
    else
      format.html { render action: :edit, notice: "Try again" }
    end
  end
end
end
