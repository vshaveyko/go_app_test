class GoCalculateSumService

  class << self
    def call(number, with_routines: false)
      url = 'calculate_sum'
      url << '_routine' if with_routines && number.to_i > 3
      GoCommunicationService.send_request(url, params: { number: number })
    end
  end

end
