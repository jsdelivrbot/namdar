module TextrazorHelper
  require 'net/http'
  require 'json'

  def get_topics_from_api(article)
    key = Rails.application.secrets.textrazor_api_key

  end
end
