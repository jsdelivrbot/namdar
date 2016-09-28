require 'net/http'
require 'json'

module Textrazor
  class Client
    ENDPOINT = 'http://api.textrazor.com'

    def initialize(args)
      @request_header = {'x-textrazor-key' => args[:key]}
    end

    def get_topics(article_body)
      return [] if article_body.length < 200

      params = 'extractors=topics&text=' + article_body
      response = do_request params

      return [] unless response["ok"] and response["response"].member? "topics"

      response["response"]["topics"]
    end

    private

    def do_request(params)
      uri = URI.parse(ENDPOINT)
      http = Net::HTTP.new(uri.host, uri.port)

      response = http.post(uri, params, @request_header)

      JSON.parse(response.body)
    end
  end
end
