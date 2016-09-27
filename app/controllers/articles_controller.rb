require 'textrazor'

class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(:created_at).reverse_order
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :body))
    @article.save

    generate_tags @article

    redirect_to article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params.require(:article).permit(:title, :body))

    generate_tags @article

    redirect_to article_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def remove_tag
    article = Article.find(params[:article_id])
    tag = Tag.find(params[:id])
    article.remove_tag(tag)

    redirect_to article_path(article)
  end

  private

  def generate_tags(article)
    topics = Textrazor::Client.new(key: Rails.application.secrets.textrazor_api_key).get_topics article.body
    topics.first(5).each do |topic|
      tag = find_or_initialize_by_name topic["label"]
      article.add_tag(tag)
    end
  end
end
