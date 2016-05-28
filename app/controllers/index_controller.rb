require 'benchmark'

class IndexController < ApplicationController

  def index; end

  def database_test; end

  def calculate_pi_position
    result = 0
    time_taken = Benchmark.measure do
     result = ::CalculatePiPositionService.(params[:number])
    end.real

    render json: { result: result, time: time_taken }
  end

  def calculate_go_pi_position
    result = 0
    time_taken = Benchmark.measure do
     result = ::GoCalculatePiPositionService.(params[:number])
    end.real

    render json: { result: result, time: time_taken }
  end

  def database_insert
    time_taken = Benchmark.measure do
     ::DatabaseTestService.(params[:number])
    end.real

    render json: { time: time_taken }
  end

  def database_insert_go
    time_taken = Benchmark.measure do
     ::DatabaseTestGoService.(params[:number])
    end.real

    render json: { time: time_taken }
  end

end
