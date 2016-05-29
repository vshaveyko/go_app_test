class GoCommunicationService

  NoHTTPClientSet = Class.new(StandardError)

  @host = ENV['GO_HOST']
  @port = ENV['GO_PORT']

  class << self
    def send_request(url, params:)
      http_client.get("/#{url}", params)
    end

    def http_client
      @http ||= Faraday.new(url: "http://#{@host}:#{@port}") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
  end

end
