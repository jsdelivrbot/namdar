class TagsController < ApplicationController
  before_action :require_admin, only: [:create, :destroy]

  def index
    @tags = Tag.all.order(:count).reverse_order
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def create
    tag = upsert_tag_by_name(params[:tag][:name])
    article = Article.find(params[:article_id])
    article.add_tag(tag)

    redirect_to article_path(params[:article_id])
  end

  def destroy
    #TODO
  end
end
