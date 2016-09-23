class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def create
    tag = Tag.find_by(params.require(:tag).permit(:name))
    article = Article.find(params[:article_id])

    if tag == nil
      tag = Tag.new(params.require(:tag).permit(:name))
      tag.save
    end

    article.tags << tag unless article.tags.include? tag
    redirect_to article_path(params[:article_id])
  end

  def destroy

  end
end
