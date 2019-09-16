require 'rails_helper'

feature "When a user visits coordinates_path they see all of the coordinates" do
 it 'they see coordinates' do

   stub_forecast_api_calls

   visit api_v1_forecast_path

  expect(page).to have_content("39.7392358,-104.990251")
  end
end
