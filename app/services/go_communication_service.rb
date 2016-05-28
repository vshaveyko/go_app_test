class GoCommunicationService

  NoHTTPClientSet = Class.new(StandardError)

  class << self
    def send_request(url, params:)
      raise NoHTTPClientSet unless @http
      @http.get("/#{url}", params)
    end

    def set_http_client(host, port)
      @http = Faraday.new(:url => "http://#{host}:#{port}") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
  end

end
