class PostsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show]

  def index
    @posts = Post.find(:all, limit: 10)
    @tags = Tag.find(:all)
    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
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
        format.html { redirect_to @post, notice: "Post created" }
      else
        format.html { render action: :edit, notice: "Try again" }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
  
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: "Post upated" }
      else
        format.html { render action: :edit }
      end
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to posts_path, notice: "Post removed"}
    end
  end
end
