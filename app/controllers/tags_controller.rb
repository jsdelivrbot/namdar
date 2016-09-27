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
    article.add_tag(tag)

    redirect_to article_path(params[:article_id])
  end

  def destroy
  end
end
