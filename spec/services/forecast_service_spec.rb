require 'rails_helper'

describe ForecastService do
  context "instance methods" do
    it "returns forecast data for given coordinates" do
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
