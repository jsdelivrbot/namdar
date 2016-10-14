class CommentsController < ApplicationController
  before_action :require_admin, except: [:create]

  def create
    article = Article.find(params[:article_id])
    comment = article.comments.create(comment_params)

    AdminMailer.new_comment_email(article, comment, get_admin_email).deliver_now

    redirect_to article_path(article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :comment_text)
  end

  def get_admin_email
    User.where(group: "admin").first.email
  end
end
