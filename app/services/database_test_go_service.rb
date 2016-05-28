class DatabaseTestGoService

  class << self
    def call(number)
      GoCommunicationService.send_request('database_test', params: { number: number })
    end
  end

end
