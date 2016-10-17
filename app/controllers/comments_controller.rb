class CommentsController < ApplicationController
  before_action :require_admin, except: [:create]

  def create
    article = Article.find(params[:article_id])
    comment = article.comments.create(comment_params)

    AdminMailer.new_comment_email(article, comment, get_admin_email).deliver_now

    redirect_to article_path(article)
  end

  def all_comments
    @comments = Comment.all.order(:created_at).reverse_order
  end

  def destroy
    article = Article.find(params[:article_id]) if params[:article_id]
    comment = Comment.find(params[:id])
    comment.destroy

    if article
      redirect_to article_path(@article)
    else
      redirect_to comments_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :comment_text)
  end

  def get_admin_email
    User.where(group: "admin").first.email
  end
end
