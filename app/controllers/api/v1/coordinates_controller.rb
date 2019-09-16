class Api::V1::CoordinatesController < ApplicationController

  # def index
  #   render json: Forecast.all
  # end

  def index
    render locals: { facade: WeatherFacade.new }
  end

  def show
    coordinates = CoordinateFacade.find_coordinates(params[:location])
    render json: CoordinateService.new(coordinates)
  end
end

#
#   def create
#     render json: Forecast.new(forecast_params)
#   end
#
#   def update
#     render json: Forecast.update(params[:id], forecast_params)
#   end
#
#   def destroy
#     render json: Forecast.delete(params[:id])
#   end
#
#   private
#
#     def forecast_params
#       params.require(:forecast).permit(:temperature, :high, :low, :humidity, :visability, :uv_index)
#     end
# end
