class CalculateSumService

  class << self
    def call(number)
      sum = 0

      number.to_i.times do |n|
        sum += 1.0 / (n + 1)
      end

      sum
    end
  end

end
