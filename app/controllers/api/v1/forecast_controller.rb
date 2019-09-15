class Api::V1::ForecastController < ApplicationController

  def index
    render json: Forecast.all
  end

  # def show
  #   render json: Forecast.find(params[:id])
  # end

end
