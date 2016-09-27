module Textrazor
  require 'net/http'
  require 'json'

  class Client
    API_KEY = Rails.application.secrets.textrazor_api_key
    REQUEST_HEADER = {'x-textrazor-key' => API_KEY}
    ENDPOINT = 'http://api.textrazor.com'

    def get_topics(article_body)
      params = 'extractors=topics&text=' + article_body
      response = do_request params

      return [] unless response["ok"]

      response["response"]["topics"]
    end

    private

    def do_request(params)
      uri = URI.parse(ENDPOINT)
      http = Net::HTTP.new(uri.host, uri.port)

      response = http.post(uri, params, REQUEST_HEADER)

      JSON.parse(response.body)
    end
  end
end
