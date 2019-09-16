class Api::V1::GifsController < ApplicationController
  def index
    forecast = ForecastService.new('39.7392358,-104.990251')
    hourly_data = forecast.forecast_data[:hourly][:data]

    hourly_data.map do |hour|
      summary = hour[:summary]
      #I realize you said daily summary... I only pulled the hourly summary in my forecast API call. I'll have to go back and fix that.
      response = Faraday.get "https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_API_KEY"]}&q=#{summary}&limit=1"
      JSON.parse(response.body, symbolize_names: true)
    end

   render json: GifSerializer.new(Gif.all)


  end

private

#add search params for locaton to controller to allow user to search by location

end
