class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def create
    tag = find_or_initialize_by_name(params[:tag][:name])
    article = Article.find(params[:article_id])

    article.tags << tag unless article.tags.include? tag
    redirect_to article_path(params[:article_id])
  end

  def destroy
  end

  private

  def find_or_initialize_by_name(name)
    tag = Tag.find_by(name: name)

    if tag == nil
      tag = Tag.new(params.require(:tag).permit(:name))
      tag.save
    end

    tag
  end
end
