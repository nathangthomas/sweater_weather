class Api::V1::ForecastController < ApplicationController

  # def index
  #  render json: Forecast.all
  # end

  def show
    ForecastFacade.new(params:location)
    forecast = ForecastFacade.forecast_data
  end
end


private

#add search params for locaton to controller to allow user to search by location


#
#   def index
#     render locals: { facade: WeatherFacade.new }
#   end
#
  # def show
  #   # render locals:{facade: ForecastFacade.new(params:location)}
  #   render json: facasde.forecast.find(params[:locations])
  # end

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
