require 'rails_helper'

describe GoogleMapsService do
  context "instance methods" do
    context "city coordinates" do
      it "returns city coordinates" do
        # WebMock.allow_net_connect!
        # stub_google_maps_api_calls

        stub_dashboard_api_calls
        coordinates = subject.coordinates

        expect(coordinates).to be_a Array
        expect(coordinates[0]).to be_a Hash
        expect(coordinates.count).to eq(1)
        expect(coordinates[0]).to have_key :lat
        expect(coordinates[0]).to have_key :lng
      end
    end
  end
end
