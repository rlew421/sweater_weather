require 'rails_helper'

RSpec.describe "Forecast API" do
  it "sends forecast for a city" do
    city = "denver"
    state = "co"

    get "/api/v1/forecast?location=#{city},#{state}"

    forecast = JSON.parse(response.body)
    expect(response).to be_successful
  end
end
