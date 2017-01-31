require 'akismet'

class CommentsController < ApplicationController
  before_action :require_admin, except: [:create]

  def create
    article = Article.find(params[:article_id])
    if spam?
      flash[:danger] = 'You are spam! aren\'t you?'
      redirect_to article_path(article)
      return
    end

    comment = article.comments.create(comment_params)

    AdminMailer.new_comment_email(article, comment, admin_email).deliver_now

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
      redirect_to article_path(article)
    else
      redirect_to comments_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :comment_text)
  end

  def admin_email
    User.where(group: 'admin').first.email
  end

  def spam?
    client = Akismet::Client.new(url: ENV['AKISMET_URL'], blog: ENV['AKISMET_BLOG'])
    opts = {
      referer: request.referer,
      permalink: request.url,
      comment_content: params[:comment][:comment_text]
    }
    client.check(request.ip, request.user_agent, opts)
  end
end
