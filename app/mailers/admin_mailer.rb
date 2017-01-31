class AdminMailer < ApplicationMailer
  def new_comment_email(article, comment, email)
    @article = article
    @comment = comment

    mail(to: email, subject: "New Comment - #{ENV['BLOG_NAME']}")
  end
end
