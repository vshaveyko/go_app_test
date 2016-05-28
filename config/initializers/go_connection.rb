proc do

  host = ENV['GO_HOST']
  port = ENV['GO_PORT']

  if host.present? and port.present?
    GoCommunicationService.set_http_client(host, port)
  end

end.call
