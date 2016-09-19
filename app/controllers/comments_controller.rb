class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comment.create(params.require(:comment).permit(:commenter, :comment_text))

    redirect_to article_path(@article)
  end
end
