class GoCalculatePiPositionService

  class << self
    def call(number)
      GoCommunicationService.send_request('calculate_pi_position', params: { number: number })
    end
  end

end
