class ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article.save
  end

  def update
  end

  def destroy
  end
end
