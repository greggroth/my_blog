class PostsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show]

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
    @post = Post.new
  end

  def create
    @post = Post.create(params[:post])
  
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
