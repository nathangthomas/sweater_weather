require 'rails_helper'

describe ForecastService do
  context "instance methods" do
    it "returns city coordinates" do
        # WebMock.allow_net_connect!
       stub_forecast_api_calls

      coordinates_data = subject.coordinates_data

      expect(coordinates_data).to be_a String
      expect(coordinates_data).to eq("39.7392358,-104.990251")
    end

    it "returns forecast data for a given city" do
      stub_forecast_api_calls
      # WebMock.allow_net_connect!


      forecast_data = subject.forecast_data

      expect(forecast_data).to be_a Hash
      expect(forecast_data).to have_key :latitude
      expect(forecast_data).to have_key :longitude
      expect(forecast_data).to have_key :currently
      expect(forecast_data).to have_key :hourly
    end
  end
end
