class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :body))

    @article.save

    redirect_to articles_path
  end

  def update
  end

  def destroy
  end
end
