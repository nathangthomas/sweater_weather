# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
end

def stub_forecast_api_calls
  coordinates = File.read("./fixtures/coordinates.json")
  stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV["GOOGLE_API_KEY"]}&address=denver").to_return(status:200, body:coordinates)

  forecast = File.read("./fixtures/forecast.json")
  stub_request(:get, "https://api.darksky.net/forecast/#{ENV["DARK_SKY_API_KEY"]}/39.7392358,-104.990251?exclude=minutely,alerts,flags").to_return(status:200, body:forecast)
end
