require 'rails_helper'

RSpec.describe "Image API" do
  it "sends background image for a location" do
    city = "denver"
    state = "co"

    get "/api/v1/backgrounds?location=#{city},#{state}"

    image_response = JSON.parse(response.body)
    expect(response).to be_successful
  end
end
