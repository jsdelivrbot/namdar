class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  end

  def create
    tag = Tag.new
    tag.name = params.require(:tag).permit(:name)

    tag.save
  end

  def destroy

  end
end
