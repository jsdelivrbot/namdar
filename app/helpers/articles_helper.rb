module ArticlesHelper
  def display_time_created(article)
    return unless article
    article.created_at.to_formatted_s(:short)
  end
end
