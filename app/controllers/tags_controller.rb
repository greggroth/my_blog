class TagsController < ApplicationController

  def index
    params[:q].gsub!(/create_(.+?)_end/) do
      Tag.create!(name: $1).id
    end
    @tags = Tag.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.json { render :json => @tags.map(&:attributes) }
    end
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
