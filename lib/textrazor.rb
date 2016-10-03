require 'net/http'
require 'json'

module Textrazor
  class Client
    ENDPOINT = 'http://api.textrazor.com'

    def initialize(args)
      @request_header = {'x-textrazor-key' => args[:key]}
    end

    def topics(text)
      return [] unless valid? text

      params = 'extractors=topics&text=' + text
      response = do_request params

      return [] unless response["ok"] and response["response"]["topics"]

      response["response"]["topics"]
    end

    def entailments(text)
      return [] unless valid? text

      params = 'extractors=entailments&text=' + text
      response = do_request params

      return [] unless response["ok"] and response["response"]["entailments"]

      response["response"]["entailments"]
    end

    private

    def do_request(params)
      uri = URI.parse(ENDPOINT)
      http = Net::HTTP.new(uri.host, uri.port)

      response = http.post(uri, params, @request_header)

      JSON.parse(response.body)
    end

    def valid?(text)
      return text.length > 200
    end
  end
end
