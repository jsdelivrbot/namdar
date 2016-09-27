require 'textrazor'

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
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

    redirect_to articles_path
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

  def generate_tags(article)
    topics = Textrazor::Client.new.get_topics article.body
    topics.first(5).each do |topic|
      tag = find_or_initialize_by_name topic["label"]
      article.tags << tag
    end
  end
end
