require 'rails_helper'

describe CoordinatesService do
  context "instance methods" do
    it "returns city coordinates" do
        # WebMock.allow_net_connect!
       stub_forecast_api_calls

      coordinates_data = subject.coordinates_data
      expect(coordinates_data).to be_a Hash
      expect( coordinates_data[:results][0][:geometry][:location].values).to be_an Array

      expect(coordinates_data[:results][0][:geometry][:location].values).to eq([39.7392358, -104.990251])

      find_coordinates = subject.find_coordinates
      expect(find_coordinates).to eq("39.7392358,-104.990251")
    end
  end
end
