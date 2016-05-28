ELASTICSEARCH_CONFIG = proc do

  host = ENV['ELASTIC_HOST']
  port = ENV['ELASTIC_PORT']

  if host.present? and port.present?
    next "http://#{host}:#{port}"
  else
    next 'http://localhost:9200'
  end

end

Elasticsearch::Model.client = Elasticsearch::Client.new(url: ELASTICSEARCH_CONFIG.call, retry_on_failure: 5)
