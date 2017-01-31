require 'faraday'

module Akismet
  class Client
    def initialize(args = {})
      url = args.fetch(:url)
      @blog = args.fetch(:blog)
      @conn = Faraday.new(url: url)
    end

    def check(user_ip, user_agent, opts = {})
      payload = {}
      payload[:blog] = blog
      payload[:user_ip] = user_ip
      payload[:user_agent] = user_agent
      payload.merge(opts)

      resp = conn.post do |req|
        req.body = payload
      end

      resp.body == 'true'
    end

    private

    attr_reader :conn, :blog
  end
end
