module ArticlesHelper
  def display_time_created(article)
    return unless article
    time_ago_in_words(article.created_at) + ' ago'
  end
end
