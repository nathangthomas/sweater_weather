class Api::V1::ForecastController < ApplicationController

  def index
    render json: Forecast.all
  end

  def show
    render json: Forecast.find(params[:id])
  end

  def create
    render json: Forecast.create!(forecast_params)
  end

  def update
    render json: Forecast.update(params[:id], forecast_params)
  end

  def destroy
    render json: Forecast.delete(params[:id])
  end

  private

    def forecast_params
      params.require(:forecast).permit(:city, :state, :country, :temperature, :high, :low, :humidity, :visability, :uv_index)
    end
end
