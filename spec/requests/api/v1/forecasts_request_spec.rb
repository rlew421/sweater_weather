require 'rails_helper'

RSpec.describe "Forecast API" do
  # it "sends forecast for a city" do
  #   city = "denver"
  #   state = "co"
  #
  #   get "/api/v1/forecast?location=#{city},#{state}"
  #
  #   forecast = JSON.parse(response.body)
  #   expect(response).to be_successful
  # end

  it "sends estimated travel time between start and end location" do
    origin = "denver,co"
    destination = "pueblo,co"
    food_type = "chinese"

    get "/api/v1/munchies?start=#{origin}&end=#{destination}&food=#{food_type}"

    result = JSON.parse(response.body)
    expect(response).to be_successful
  end
end
