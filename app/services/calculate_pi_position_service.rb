require "bigdecimal/math"
class CalculatePiPositionService

  class << self
    def call(number)
      new.calculate(number)
    end
  end

  def calculate(number)
    number = number.to_i.to_s
    n = 1
    pi = 0
    loop do
      pi = BigMath::PI(n).to_s[0..(n + 1)]
      n += 1
      break if number.in?(pi)
    end
     {
      result_pi: pi,
      iterations: n
     }
  end

end
