require 'benchmark'

class IndexController < ApplicationController

  def index; end

  def database_test; end

  def calculate_sum
    result = 0
    time_taken = Benchmark.measure do
     result = ::CalculateSumService.(params[:number])
    end.real

    render json: { result: result, time: time_taken }
  end

  def calculate_sum_go
    result = 0
    time_taken = Benchmark.measure do
     result = ::GoCalculateSumService.(params[:number])
    end.real

    puts result
    render json: { result: result, time: time_taken }
  end

  def calculate_sum_go_routines
    result = 0
    time_taken = Benchmark.measure do
     result = ::GoCalculateSumService.(params[:number], with_routines: true)
    end.real

    puts result
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
