require 'rails_helper'

RSpec.describe "a city name can be received in a get request" do
  it "and can be sent to Google's API to retrieve lat and long for that city" do
    json_response = File.read('spec/fixtures/denver_data.json')
    actual_response = stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyAlNwBuw18OQJcEOrEzJQI9Z2bwmFtGNKc&address=Denver").
      to_return(status: 200, body: json_response)
  end
end
